import pandas as pd
import re
from ExcelProcessor import ExcelProcessor 
from DartCodeGenerator import DartCodeGenerator


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
    """Write Dart code to a file."""
    with open(file_path, 'w', encoding='utf-8') as file:
        file.write(content)

# Main processing
def process_combined_projects(file_path, sheet_name):
    # Load data into a single DataFrame
    df = pd.read_excel(file_path, sheet_name=sheet_name)

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
    filtered_data = df[df['data_type'].str.strip().str.lower().isin(['dropdown', 'multicheck'])].copy()

    # Ensure all relevant columns are strings and clean
    for col in ['field_names_in_english', 'field_names_in_tamil', 'field_names_in_sinhala']:
        filtered_data[col] = filtered_data[col].apply(lambda x: str(x).strip() if not pd.isnull(x) else '')

    # Flatten field names in English
    filtered_data['field_names_in_english'] = filtered_data['field_names_in_english'].apply(lambda x: [i.strip() for i in x.split(',')])
    flattened_data = filtered_data.explode('field_names_in_english').reset_index(drop=True)

    grouped_data = flattened_data.groupby('database')['field_names_in_english'].apply(list).to_dict()
    localization_data = {lang: {} for lang in ['English', 'Tamil', 'Sinhala']}

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
        content = '// Auto-generated localization file\n\n'
        content += 'class Languages {\n'
        for key, value in localization_data[lang].items():
            content += f'  String get {key} => "{value}";\n'
        content += '}\n'
        write_dart_file(file_path, content)
        

    # Generate grouped data Dart code
    dart_code_project_2 = ""
    for database, fields in grouped_data.items():
        dart_code_project_2 += f"if (modelName == '{database}') {{\n"
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
        # Specify the file path and sheet name
        process_combined_projects(
            file_path='atique.xlsx',
            sheet_name='IncomeInfo'  # Update this to your actual sheet name
        )
                # Initialize and load Excel data
        processor = ExcelProcessor(file_path='atique.xlsx', sheet_name='IncomeInfo')
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
        
