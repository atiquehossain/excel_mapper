import pandas as pd
import re
from ExcelProcessor import ExcelProcessor 
from DartCodeGenerator import DartCodeGenerator
import os
from datetime import datetime
from num2words import num2words
from openpyxl import load_workbook


def convert_number_to_text(value):
    """Convert numeric values to text."""
    try:
        # Only convert numeric values
        if isinstance(value, (int, float)):
            print(f" onverting done")

            return num2words(value)
        return value  # Return non-numeric values as-is
    except Exception as e:
        print(f"Error converting {value}: {e}")
        return value


# Helper functions
def clean_column_name(name):
    """Clean column names by replacing non-alphanumeric characters with underscores."""
    return re.sub(r'[^0-9a-zA-Z]+', '_', str(name).strip()).lower()

def clean_data_type(data_type):
    """Clean data type names by replacing non-alphanumeric characters with underscores."""
    if isinstance(data_type, str):
        return re.sub(r'[^0-9a-zA-Z]+', '_', data_type.strip()).lower()
    return data_type

def sanitize_key(name):
    """Sanitize keys to ensure they are valid Dart identifiers."""
    return re.sub(r'[^0-9a-zA-Z]+', '_', str(name).strip()).lower()

def write_dart_file(file_path, content):
    folder_path = 'for_the_level'
    """Write Dart code to a file."""
    os.makedirs(folder_path, exist_ok=True)  # Ensure the output folder exists
    file_path = os.path.join(folder_path, file_path)
    with open(file_path, 'w', encoding='utf-8') as file:
        file.write(content)

def load_excel_skip_hidden_rows(file_path, sheet_name):
    """Load Excel file while skipping hidden rows."""
    # Load the workbook and sheet
    workbook = load_workbook(file_path, data_only=True)
    sheet = workbook[sheet_name]

    # Identify hidden rows
    hidden_rows = [row for row in sheet.row_dimensions if sheet.row_dimensions[row].hidden]

    # Read the Excel file with pandas
    df = pd.read_excel(file_path, sheet_name=sheet_name)

    # Drop hidden rows by their index (Excel row numbers are 1-based)
    df = df.drop(index=[row - 1 for row in hidden_rows if row <= len(df)])

    return df

# Main processing
def process_combined_projects(file_path, sheet_name):
    # Load data into a single DataFrame
    df = load_excel_skip_hidden_rows(file_path, sheet_name)

        # Convert numbers to text in all columns
    for col in df.columns:
        df[col] = df[col].apply(convert_number_to_text)

    # Clean column names
    df.columns = [clean_column_name(col) for col in df.columns]

    # Clean column names
    df.columns = [clean_column_name(col) for col in df.columns]



    # -------------------- Project 2: Localization and Fields --------------------
    required_columns_project_2 = [
        'field_names_in_english',
        'field_names_in_tamil',
        'field_names_in_sinhala',
        'data_type',
        'database'
    ]
    missing_columns_2 = [col for col in required_columns_project_2 if col not in df.columns]
    if missing_columns_2:
        raise ValueError(f"Missing columns for Project 2: {', '.join(missing_columns_2)}")

    # Fill missing data in `data_type` and `database`
    df['data_type'] = df['data_type'].ffill()
    df['database'] = df['database'].ffill()

    # Filter rows for dropdown or multicheck data types
    filtered_data = df[df['data_type'].str.strip().str.lower().isin(['dropdown', 'multiple_choice'])].copy()

    # Ensure all relevant columns are strings and clean
    for col in ['field_names_in_english', 'field_names_in_tamil', 'field_names_in_sinhala']:
        filtered_data[col] = filtered_data[col].apply(lambda x: str(x).strip() if not pd.isnull(x) else '')

    # Flatten field names in English
    filtered_data['field_names_in_english'] = filtered_data['field_names_in_english'].apply(lambda x: [i.strip() for i in x.split(',')])
    flattened_data = filtered_data.explode('field_names_in_english').reset_index(drop=True)

    grouped_data = flattened_data.groupby('database')['field_names_in_english'].apply(list).to_dict()
    localization_data = {lang: {} for lang in ['English', 'Tamil', 'Sinhala']}
    today_date = datetime.now().strftime('%Y-%m-%d')

    for _, row in flattened_data.iterrows():
        english_name = row['field_names_in_english']
        tamil_name = row['field_names_in_tamil']
        sinhala_name = row['field_names_in_sinhala']
        sanitized_key = sanitize_key(english_name)
        localization_data['English'][sanitized_key] = english_name
        localization_data['Tamil'][sanitized_key] = tamil_name
        localization_data['Sinhala'][sanitized_key] = sinhala_name

    # Generate localization files
    for lang, file_path in {'English': 'en_field.dart', 'Tamil': 'ta_field.dart', 'Sinhala': 'si_field.dart'}.items():
        content = f'// Auto-generated localization file - {today_date}\n\n'
        content += 'class Languages {\n'
        for key, value in localization_data[lang].items():
            content += f'  String get {key} => "{value}";\n'
        content += '}\n'
        write_dart_file(file_path, content)
        

    # Generate grouped data Dart code
    dart_code_project_2 = ""
    for database, fields in grouped_data.items():
        dart_code_project_2 += f"else if (modelName == SetupConstant.{database}) {{\n"
        for index, field in enumerate(fields, start=1):
            sanitized_field = sanitize_key(field)
            dart_code_project_2 += f"  items.add(SetupModel(Languages.getText(context)!.{sanitized_field}, \"{index}\"));\n"
        dart_code_project_2 += "}\n\n"

    write_dart_file("project2_fields.dart", dart_code_project_2)

    print("Both projects have been processed successfully!")
    print("Files generated: project1_widgets.dart, en.dart, ta.dart, si.dart, project2_fields.dart")

# Main execution
if __name__ == "__main__":
    try:
        file_path='atique.xlsx'
        sheet_name='Income' 
        
        #column name
        data_type = 'data_type'
        questions_in_english='questions_in_english'
        labels_in_english= 'labels_in_english'
        database = 'database'

        #field name
        field_names_in_english = 'field_names_in_english'
        field_names_in_tamil = 'field_names_in_tamil'
        field_names_in_sinhala ='field_names_in_sinhala'



        # Specify the file path and sheet name
        process_combined_projects(
            file_path=file_path,
            sheet_name=sheet_name  # Update this to your actual sheet name
        )
                # Initialize and load Excel data
        processor = ExcelProcessor(file_path=file_path, sheet_name=sheet_name)
        processor.load_sheet()

        # Validate columns
        required_columns = ['questions_in_english', 'labels_in_english', 'data_type', 'database']
        df = processor.get_dataframe()
        # Validate columns and identify missing ones
        missing_columns = [col for col in required_columns if col not in df.columns]
        if missing_columns:
            raise ValueError(f"Missing required columns in the sheet: {', '.join(missing_columns)}")

        if not all(col in df.columns for col in required_columns):
            raise ValueError(f"Missing required columns in the sheet.")

        # Initialize Dart generator
        class_name = re.sub(r'[^\w]+', '_', processor.sheet_name).title().replace("_", "")
        dart_generator = DartCodeGenerator(class_name, df)
        print(dart_generator.DART_WIDGET_TEMPLATE)

        # Process rows
        for _, row in df.iterrows():
            dart_generator.process_row(row, processor.clean_data_type)

        # Generate files
        dart_generator.generate_files()
        
    except Exception as e:
        print(f"Error: {e}")
        
