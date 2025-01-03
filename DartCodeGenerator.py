import pandas as pd
import re
import os
from widgetTemp import DartWidgetGenerator
from TemplateProvider import TemplateProvider 
from datetime import datetime

class DartCodeGenerator:
    """Generates Dart code for widgets, models, and localization."""

    # Mapping of data types to field types and Dart types
    DATA_TYPE_TO_FIELD_TYPE = {
        "Dropdown": "AppConstant.FieldType_dropdown",
        "Multiple choice": "AppConstant.FieldType_multiple_choice",
        "radio": "AppConstant.FieldType_radio",
        "Number": "AppConstant.FieldType_EditText",
        "Text": "AppConstant.FieldType_EditText",
        "Image": "AppConstant.FieldType_Image"
    }

    DATA_TYPE_TO_DART_TYPE = {
        "Dropdown": "String",
        "Multiple choice": "String",
        "radio": "int",
        "Number": "double",
        "Text": "String",
        "Image": "String",
    }

    def __init__(self, class_name, df, output_folder='ui_and_languages'):
        """Initializes the DartCodeGenerator instance with necessary parameters and folder setup."""
        self.class_name = class_name
        self.df = df
        self.localization_data = {"Tamil": {}, "Sinhala": {}, "English": {}}
        self.dart_widgets = []
        self.model_fields = []
        self.constructor_params = []
        self.from_json = []
        self.to_json = []
        self.to_string = []
        self.output_folder = output_folder

        # Initialize the widget template
        self.DART_WIDGET_TEMPLATE = ""

        # Create output folder if it doesn't exist
        os.makedirs(self.output_folder, exist_ok=True)

    def _sanitize_string(self, value):
        """Sanitizes a string for Dart compatibility."""
        if not pd.notna(value):
            return "Missing value"
        
        return (
            value.replace('\\', '\\\\')  # Escape backslashes first
                .replace('\n', '\\n')   # Escape newlines
                .replace('\t', '\\t')   # Escape tabs
                .replace('"', '\\"')    # Escape double quotes
                .strip()
        )

    def _get_data_list_conditionally_const(self, field_type, model):
        """Returns the corresponding data list or null based on the field type."""
        if field_type in ['AppConstant.FieldType_multiple_choice', 'AppConstant.FieldType_dropdown', 'AppConstant.FieldType_radio']:
            return f"SetupConstant.{model}"
        else:
            return "null"  

    def _get_data_list_conditionally_type_and_model(self, field_type, model):
        """Returns the corresponding function to fetch the data list based on the field type."""
        if field_type == 'AppConstant.FieldType_multiple_choice':
            return f"SetupData.SetupData.getCheklistItems(context, SetupConstant.{model})"
        elif field_type == 'AppConstant.FieldType_dropdown':
            return f"SetupData.getDropDownItems(context, SetupConstant.{model})"
        elif field_type == 'AppConstant.FieldType_radio':
            return f"SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.{model})"
        else:
            return "null" 

    def process_row(self, row, clean_data_type, row_number):
        """Processes a single row of data to generate widget and model information."""
        question_en = row.get('questions_in_english', None)
        label_en = row.get('labels_in_english', None)
        data_type = clean_data_type(row.get('data_type', None))
        model = row.get('database', None)
        

        if not pd.notna(model) or str(model).strip() == "":
            # Skip row if model is missing or empty
            return

        # Safely handle and sanitize strings
        question_en = self._sanitize_string(str(question_en) if pd.notna(question_en) else "Missing value in excel")
        label_en = self._sanitize_string(str(label_en) if pd.notna(label_en) else "Missing value in excel")
        field_type = self.DATA_TYPE_TO_FIELD_TYPE.get(data_type, "AppConstant.FieldType_EditText")
        dart_type = self.DATA_TYPE_TO_DART_TYPE.get(data_type, "String")

        # Clean and format the keys for localization
        question_key = re.sub(r'[^\w]+', '_', str(question_en).strip()).strip('_')
        label_key = re.sub(r'[^\w]+', '_', str(label_en).strip()).strip('_')

        # Add localization data for English
        self.localization_data["English"][question_key] = question_en
        self.localization_data["English"][label_key] = label_en

        # Add localization data for Tamil and Sinhala if available
        for lang in ["Tamil", "Sinhala"]:
            question_value = row.get(f"questions_in_{lang.lower()}", None)
            label_value = row.get(f"labels_in_{lang.lower()}", None)
            if pd.notna(question_value):
                self.localization_data[lang][question_key] = self._sanitize_string(str(question_value))
            if pd.notna(label_value):
                self.localization_data[lang][label_key] = self._sanitize_string(str(label_value))

        # Append the widget code to the list for Dart widget generation
        self.dart_widgets.append(
            f"""
                    /// Question number  = {row_number + 2}
                    build{self.class_name}Question(
                    number: {row_number + 2},
                    condition: true, 
                    widget: {self.class_name}UI(
                        label: {(
                            f'"{label_en}"' 
                            if label_en == "Missing value in excel" 
                            else f"Languages.getText(context)!.{label_key}"
                        )},
                        question: {(
                            f'"{question_en}"' 
                            if question_en == "Missing value in excel" 
                            else f"Languages.getText(context)!.{question_key}"
                        )},
                        fieldType: {field_type},
                        model: {self.class_name.lower()}.{model},
                        dataList: {self._get_data_list_conditionally_type_and_model(field_type, model)},
                        onChanged: (value) {{
                            {self.class_name.lower()}.{model} = value;
                            selectedOptions[{(
                                f'"{question_en}"' 
                                if question_en == "Missing value in excel" 
                                else f"Languages.getText(context)!.{question_key}"
                            )}] = {self._get_data_list_conditionally_const(field_type, model)} 
                                + AppConstant.SEPERATOR 
                                + value;
                        }},
                    ),
                    ),
            """
        )

        # Append model field definitions
        self.model_fields.append(f"final {dart_type} {model};")
        self.constructor_params.append(f"this.{model},")
        self.from_json.append(f"{model}: json['{model}'],")
        self.to_json.append(f"'{model}': {model},")
        self.to_string.append(f"{model}: ${{{model}}}")

    def generate_files(self):
        """Generates and saves Dart widget, model, and localization files."""

        # Generate the Dart widget code
        self.DART_WIDGET_TEMPLATE = DartWidgetGenerator.generate_widget_template(
            self.class_name, self.class_name.lower(), "\n".join(self.dart_widgets)
        )

        # Generate the Dart model code
        dart_model_code = TemplateProvider.get_model_template().format(
            class_name=self.class_name,
            fields="\n  ".join(self.model_fields),
            constructor_params="\n    ".join(self.constructor_params),
            from_json="\n      ".join([f"{field.strip()};" for field in self.from_json]),
            to_json="\n      ".join(self.to_json),
            to_string=", ".join(self.to_string)
        )

        # Write the widget code to the file
        with open(os.path.join(self.output_folder, f"{self.class_name.lower()}_ui_widget.dart"), 'w', encoding='utf-8') as f:
            f.write(self.DART_WIDGET_TEMPLATE)

        # Write the model code to the file
        with open(os.path.join(self.output_folder, f"{self.class_name.lower()}_model.dart"), 'w', encoding='utf-8') as f:
            f.write(dart_model_code)

        # Write the localization files for each language
        root_sheet_name = self.class_name
        today_date = datetime.now().strftime('%Y-%m-%d')

        for lang, translations in self.localization_data.items():
            localization_fields = [
                f'String get {key} => "{self._sanitize_string(value)}";'
                for key, value in translations.items()
            ]
            localization_code = TemplateProvider.get_localization_template(root_sheet_name, today_date).format(
                root_sheet_name=root_sheet_name,
                today_date=today_date,
                fields="\n  ".join(localization_fields)
            )
            output_file = os.path.join(self.output_folder, f"languages_{self.class_name.lower()}_{lang.lower()}.dart")
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(localization_code)

        # Write the keys file for localization
        for lang, translations in self.localization_data.items():
            localization_fields = [f'String get {key};' for key, value in translations.items()]
            localization_code = TemplateProvider.get_localization_template(root_sheet_name, today_date).format(
                root_sheet_name=root_sheet_name,
                today_date=today_date,
                fields="\n  ".join(localization_fields)
            )
            with open(os.path.join(self.output_folder, f"keys.dart"), 'w', encoding='utf-8') as f:
                f.write(localization_code)

        print(f"Dart files generated for class: {self.class_name} in {self.output_folder}")
