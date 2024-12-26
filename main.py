import pandas as pd
import re
from ExcelProcessor import ExcelProcessor 
from DartCodeGenerator import DartCodeGenerator
import os
from datetime import datetime
from num2words import num2words
from openpyxl import load_workbook

# Helper Functions
def convert_number_to_text(value):
    """Convert numeric values to text."""
    try:
        if isinstance(value, (int, float)):
            return num2words(value)
        return value
    except Exception as e:
        print(f"Error converting {value}: {e}")
        return value

def clean_column_name(name):
    """Clean column names by replacing non-alphanumeric characters with underscores."""
    return re.sub(r'[^0-9a-zA-Z]+', '_', str(name).strip()).lower()

def sanitize_key(name):
    """Sanitize keys to ensure they are valid Dart identifiers."""
    return re.sub(r'[^0-9a-zA-Z]+', '_', str(name).strip()).lower()

def write_dart_file(file_path, content):
    """Write Dart code to a file."""
    folder_path = 'for_the_level'
    os.makedirs(folder_path, exist_ok=True)
    file_path = os.path.join(folder_path, file_path)
    with open(file_path, 'w', encoding='utf-8') as file:
        file.write(content)

def load_excel_skip_hidden_rows(file_path, sheet_name):
    """Load Excel file while skipping hidden rows."""
    workbook = load_workbook(file_path, data_only=True)
    sheet = workbook[sheet_name]
    hidden_rows = [row for row in sheet.row_dimensions if sheet.row_dimensions[row].hidden]
    df = pd.read_excel(file_path, sheet_name=sheet_name)
    df = df.drop(index=[row - 1 for row in hidden_rows if row <= len(df)])
    return df

def count_dropdown_and_multiple_choice_columns(df, threshold=10):
    """Count the number of dropdown and multiple-choice columns in a DataFrame."""
    dropdown_columns = [col for col in df.columns if df[col].nunique() <= threshold]
    return len(dropdown_columns), dropdown_columns

# Main Function
def process_combined_projects(file_path, sheet_name):
    # Load data
    df = load_excel_skip_hidden_rows(file_path, sheet_name)
    count, columns = count_dropdown_and_multiple_choice_columns(df, threshold=10)
    print(f"Number of dropdown/multiple-choice columns: {count}")
    print("Columns identified as dropdown/multiple-choice:", columns)

    # Clean column names
    df.columns = [clean_column_name(col) for col in df.columns]
    print(f"Cleaned columns: {df.columns}")

    # Ensure required columns for Project 2
    required_columns = ['field_names_in_english', 'field_names_in_tamil', 'field_names_in_sinhala', 'data_type', 'database']
    missing_columns = [col for col in required_columns if col not in df.columns]
    if missing_columns:
        raise ValueError(f"Missing columns for Project 2: {', '.join(missing_columns)}")

    # Fill missing data
    df['data_type'] = df['data_type'].ffill()
    df['database'] = df['database'].ffill()

    # Filter dropdown and multiple-choice rows
    filtered_data = df[df['data_type'].str.strip().str.lower().isin(['dropdown', 'multiple choice'])].copy()

    # Ensure all relevant columns are strings and clean
    for col in ['field_names_in_english', 'field_names_in_tamil', 'field_names_in_sinhala']:
        filtered_data[col] = filtered_data[col].apply(lambda x: str(x).strip() if not pd.isnull(x) else '')

    # Flatten field names in English
    # No splitting of `field_names_in_english`
    filtered_data['field_names_in_english'] = filtered_data['field_names_in_english'].apply(lambda x: str(x).strip() if not pd.isnull(x) else '')

    # Sanitize key directly from the full row value
    filtered_data['sanitized_key'] = filtered_data['field_names_in_english'].apply(sanitize_key)

    #filtered_data['field_names_in_english'] = filtered_data['field_names_in_english'].apply(lambda x: [i.strip() for i in x.split(',')])
    flattened_data = filtered_data.explode('field_names_in_english').reset_index(drop=True)

    # Group data by database
    grouped_data = flattened_data.groupby('database')['field_names_in_english'].apply(list).to_dict()

    # Generate localization data
    localization_data = {lang: {} for lang in ['English', 'Tamil', 'Sinhala']}
    today_date = datetime.now().strftime('%Y-%m-%d')

    for _, row in flattened_data.iterrows():
        english_name = row['field_names_in_english']
        tamil_name = row['field_names_in_tamil']
        sinhala_name = row['field_names_in_sinhala']
        database_name = sanitize_key(row['database'])  # Sanitize the database name
        sanitized_key = f"{sanitize_key(english_name)}_{database_name}"  # Append database to the key

        localization_data['English'][sanitized_key] = english_name
        localization_data['Tamil'][sanitized_key] = tamil_name
        localization_data['Sinhala'][sanitized_key] = sinhala_name


    # Generate localization files
    for lang, file_path in {'English': 'en_field.dart', 'Tamil': 'ta_field.dart', 'Sinhala': 'si_field.dart'}.items():
        content = f"/// {sheet_name} localization file - {today_date}\n\n"
        content += "class Localization {\n"
        for key, value in localization_data[lang].items():
            content += f"  String get {key} => '{value}';\n"
        content += "}\n"
        write_dart_file(file_path, content)


    # Generate keys file
    file_path = "field_keys.dart"
    content = f"/// {sheet_name} keys file - {today_date}\n\n"
    content += "\n"
    for key in localization_data['English'].keys():
        content += f"  String get {key};\n"
    content += f"/// {sheet_name} enf keys \n"
    write_dart_file(file_path, content)

    # Generate grouped data Dart code
    dart_code = ""
    for database, fields in grouped_data.items():
        dart_code += f"static const String {database} = \"{database}\";\n"

    for database, fields in grouped_data.items():
        dart_code += f"else if (modelName == SetupConstant.{database}) {{\n"
        for index, field in enumerate(fields, start=1):
            sanitized_field = sanitize_key(field)
            dart_code += f"  items.add(SetupModel(Languages.getText(context)!.{sanitized_field}_{database}, \"{index}\"));\n"
        dart_code += "}\n\n"


    write_dart_file("setupData.dart", dart_code)

    print("Processing completed successfully!")
    print("Files generated: en_field.dart, ta_field.dart, si_field.dart, field_keys.dart, setupData.dart")  

# Main execution
if __name__ == "__main__":
    try:   

        file_path='u_find.xlsx'
        sheet_name='IncomeInfo' 
        
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

        #missing 
        missing_columns = [col for col in required_columns if col not in df.columns]
        if missing_columns:
            raise ValueError(f"Missing required columns in the sheet :::: {', '.join(missing_columns)}")

        if not all(col in df.columns for col in required_columns):
            raise ValueError(f"Missing required columns in the sheet.")

        # Initialize Dart generator
        class_name = re.sub(r'[^\w]+', '_', processor.sheet_name).title().replace("_", "")
        dart_generator = DartCodeGenerator(class_name, df)
        print(dart_generator.DART_WIDGET_TEMPLATE)

        # Process rows
        for index, row in df.iterrows():
            dart_generator.process_row(row, processor.clean_data_type, index)

        # Generate files
        dart_generator.generate_files()
        
    except Exception as e:
        print(f"Error: {e}")
        
