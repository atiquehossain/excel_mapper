import pandas as pd
import re
from widgetTemp import DartWidgetGenerator

class DartCodeGenerator:
    """Generates Dart code for widgets, models, and localization."""
    DATA_TYPE_TO_FIELD_TYPE = {
        "Dropdown": "AppConstant.FieldType_dropdown",
        "Multiple choice": "AppConstant.FieldType_multiple_choice",
        "YES/NO": "AppConstant.FieldType_radio",
        "Number": "AppConstant.FieldType_EditText",
        "Text": "AppConstant.FieldType_EditText",
        "Image": "AppConstant.FieldType_Image"
    }

    DATA_TYPE_TO_DART_TYPE = {
        "Dropdown": "int",
        "Multiple choice": "String",
        "YES/NO": "int",
        "Number": "double",
        "Text": "String",
        "Image": "String",
    }

    DART_WIDGET_TEMPLATE = ""



    DART_MODEL_TEMPLATE = """
class {class_name}Model {{
  {fields}

  {class_name}Model({{
    {constructor_params}
  }});

  factory {class_name}Model.fromJson(Map<String, dynamic> json) {{
    return {class_name}Model(
      {from_json}
    );
  }}

  Map<String, dynamic> toJson() {{
    return {{
      {to_json}
    }};
  }}
}}
"""

    LOCALIZATION_TEMPLATE = """
class Languages {{
  static Languages? _instance;
  static Languages getText(BuildContext context) => _instance ??= Languages();

  {fields}
}}
"""

    def __init__(self, class_name, df):
        self.class_name = class_name
        self.df = df
        self.localization_data = {"Tamil": {}, "Sinhala": {}, "English": {}}
        self.dart_widgets = []
        self.model_fields = []
        self.constructor_params = []
        self.from_json = []
        self.to_json = []


    def process_row(self, row, clean_data_type):
      """Processes a single row of data to generate widget and model information."""
      question_en = row.get('questions_in_english', None)
      label_en = row.get('labels_in_english', None)
      data_type = clean_data_type(row.get('data_type', None))
      model = row.get('database', None)

      # Skip row if database (model) is missing or invalid
      if not pd.notna(model) or str(model).strip() == "":
          print(f"Skipping row due to missing or invalid 'database' field: {row}")
          return

      # Default fallback values
      question_en = question_en if pd.notna(question_en) else "Missing value in excel"
      label_en = label_en if pd.notna(label_en) else "Missing value in excel"
      field_type = self.DATA_TYPE_TO_FIELD_TYPE.get(data_type, "AppConstant.FieldType_EditText")
      dart_type = self.DATA_TYPE_TO_DART_TYPE.get(data_type, "String")

      # Generate localization keys
      question_key = re.sub(r'[^\w]+', '_', question_en.strip()).strip('_')
      label_key = re.sub(r'[^\w]+', '_', label_en.strip()).strip('_')

      # Add to localization data
      self.localization_data["English"][question_key] = question_en
      self.localization_data["English"][label_key] = label_en

      for lang in ["Tamil", "Sinhala"]:
          question_value = row.get(f"questions_in_{lang.lower()}", None)
          label_value = row.get(f"labels_in_{lang.lower()}", None)
          if pd.notna(question_value):
              self.localization_data[lang][question_key] = question_value
          if pd.notna(label_value):
              self.localization_data[lang][label_key] = label_value

      # Generate Dart widget
      self.dart_widgets.append(f"""
      {self.class_name}UI(
        label: {(f'"{label_en}"' if label_en == "Missing value in excel" else f"Languages.getText(context)!.{label_key}")},
        question: {(f'"{question_en}"' if question_en == "Missing value in excel" else f"Languages.getText(context)!.{question_key}")},
        fieldType: {field_type},
        model: {self.class_name.lower()}.{model},
        dataList: null,
        onChanged: (value) {{
            {self.class_name.lower()}.{model} = value;
            selectedOptions[{(f'"{question_en}"' if question_en == "Missing value in excel" else f"Languages.getText(context)!.{question_key}")}] = dataList + AppConstant.SEPERATOR + value;
        }},
      )
      """)

      # Add to model fields
      self.model_fields.append(f"final {dart_type} {model};")
      self.constructor_params.append(f"this.{model},")
      self.from_json.append(f"{model}: json['{model}'],")
      self.to_json.append(f"'{model}': {model},")

   
   
    def generate_files(self):
        """Generates and saves Dart widget, model, and localization files."""
        # Generate Dart widget code
        # Generate Dart widget code
        self.DART_WIDGET_TEMPLATE = DartWidgetGenerator.generate_widget_template(self.class_name, self.class_name.lower(), "\n".join(self.dart_widgets))

        #self.DART_WIDGET_TEMPLATE = abcd.func(self.class_name,self.class_name.lower(), self.dart_widgets)
        # dart_widget_code = self.DART_WIDGET_TEMPLATE.format(
        #     class_name=self.class_name,
        #     model_instance=self.class_name.lower(),
        #     widgets="\n".join(self.dart_widgets)
        # )

        dart_widget_code = self.DART_WIDGET_TEMPLATE



        # Generate Dart model code
        dart_model_code = self.DART_MODEL_TEMPLATE.format(
            class_name=self.class_name,
            fields="\n  ".join(self.model_fields),
            constructor_params="\n    ".join(self.constructor_params),
            from_json="\n      ".join(self.from_json),
            to_json="\n      ".join(self.to_json)
        )

        # Write widget file
        with open(f"{self.class_name.lower()}_ui_widget.dart", 'w', encoding='utf-8') as f:
            f.write(dart_widget_code)

        # Write model file
        with open(f"{self.class_name.lower()}_model.dart", 'w', encoding='utf-8') as f:
            f.write(dart_model_code)

        # Write localization files
        for lang, translations in self.localization_data.items():
            localization_fields = [f'String get {key} => "{value}";' for key, value in translations.items()]
            localization_code = self.LOCALIZATION_TEMPLATE.format(fields="\n  ".join(localization_fields))
            with open(f"languages_{self.class_name.lower()}_{lang.lower()}.dart", 'w', encoding='utf-8') as f:
                f.write(localization_code)

        print(f"Dart files generated for class: {self.class_name}")
