import pandas as pd
import re

# File paths
file_path = 'atique.xlsx'  
sheet_name = 'IncomeInfo' 

# Helper function to clean column names
def clean_column_name(name):
    return re.sub(r'[^0-9a-zA-Z]+', '_', name.strip()).lower()

# Helper function to clean data type names
def clean_data_type(data_type):
    # Check if the value is a string before applying strip and regex
    if isinstance(data_type, str):
        return re.sub(r'[^0-9a-zA-Z]+', '_', data_type.strip()).lower()
    return data_type  # Return non-string values as they are

# Helper function to sanitize keys
def sanitize_key(name):
    return re.sub(r'[^0-9a-zA-Z]+', '_', name.strip()).lower()

# Read Excel data
sheet_data = pd.read_excel(file_path, sheet_name=sheet_name)

# Clean column names
sheet_data.columns = [clean_column_name(col) for col in sheet_data.columns]

# Clean data type column
sheet_data['data_type'] = sheet_data['data_type'].apply(clean_data_type)

# Define required columns
required_columns = [
    'field_names_in_english',
    'field_names_in_tamil',
    'field_names_in_sinhala',
    'data_type',
    'database'
]

# Check for missing columns
missing_columns = [col for col in required_columns if col not in sheet_data.columns]
if missing_columns:
    print(f"Error: Missing required columns: {missing_columns}")
    exit(1)

# Fill missing data
sheet_data['data_type'] = sheet_data['data_type'].ffill()
sheet_data['database'] = sheet_data['database'].ffill()

# Filter relevant rows
filtered_data = sheet_data[sheet_data['data_type'].str.strip().str.lower().isin(['dropdown', 'multicheck'])].copy()

# Clean and transform data
filtered_data.loc[:, 'field_names_in_english'] = filtered_data['field_names_in_english'].astype(str).str.strip()
filtered_data.loc[:, 'field_names_in_tamil'] = filtered_data['field_names_in_tamil'].astype(str).str.strip()
filtered_data.loc[:, 'field_names_in_sinhala'] = filtered_data['field_names_in_sinhala'].astype(str).str.strip()

# Flatten Field Names in English
filtered_data.loc[:, 'field_names_in_english'] = filtered_data['field_names_in_english'].apply(lambda x: [i.strip() for i in x.split(',')])
flattened_data = filtered_data.explode('field_names_in_english').reset_index(drop=True)

# Generate grouped data
grouped_data = flattened_data.groupby('database')['field_names_in_english'].apply(list).to_dict()

# Generate localization files and key file
languages = ['English', 'Tamil', 'Sinhala']
localization_files = {
    'English': 'en.dart',
    'Tamil': 'ta.dart',
    'Sinhala': 'si.dart',
}
key_file_path = 'keys.dart'

localization_data = {lang: {} for lang in languages}

# Populate localization data
for _, row in flattened_data.iterrows():
    english_name = row['field_names_in_english']
    tamil_name = row['field_names_in_tamil']
    sinhala_name = row['field_names_in_sinhala']
    sanitized_key = sanitize_key(english_name)
    localization_data['English'][sanitized_key] = english_name
    localization_data['Tamil'][sanitized_key] = tamil_name
    localization_data['Sinhala'][sanitized_key] = sinhala_name

# Write localization files
for lang, file_path in localization_files.items():
    with open(file_path, 'w', encoding='utf-8') as loc_file:
        loc_file.write('// Auto-generated localization file\n\n')
        loc_file.write('class Languages {\n')
        for key, value in localization_data[lang].items():
            loc_file.write(f'  String get {key} => "{value}";\n')
        loc_file.write('}\n')

# Write key file
with open(key_file_path, 'w', encoding='utf-8') as key_file:
    key_file.write('// Auto-generated keys file\n\n')
    key_file.write('class Keys {\n')
    for key in localization_data['English'].keys():
        key_file.write(f'  String get {key};\n')
    key_file.write('}\n')

# Dart code generation
dart_code = ""

for database, fields in grouped_data.items():
    print(f"Generating conditional logic for: {database}")  # Debug statement
    dart_code += f"if (modelName == '{database}') {{\n"
    for index, field in enumerate(fields, start=1):
        sanitized_field = sanitize_key(field)
        dart_code += f"  items.add(SetupModel(Languages.getText(context)!.{sanitized_field}, \"{index}\"));\n"
    dart_code += "}\n\n"

# Write Dart code to file
output_path = 'generated_code.dart'
with open(output_path, 'w', encoding='utf-8') as dart_file:
    dart_file.write(dart_code)

print(f"Dart code has been successfully generated and saved to {output_path}!")
print(f"Localization files: {', '.join(localization_files.values())}")
print(f"Key file: {key_file_path}")
