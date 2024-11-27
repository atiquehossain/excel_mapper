import pandas as pd
import re
class ExcelProcessor:
    """Handles processing of the Excel file and data extraction."""
    DATA_TYPE_MAPPINGS = {
        "dropdown": "Dropdown",
        "multiple choice": "Multiple choice",
        "yes/no": "YES/NO",
        "number": "Number",
        "text": "Text",
        "image": "Image",
    }

    def __init__(self, file_path, sheet_name):
        self.file_path = file_path
        self.sheet_name = sheet_name
        self.df = None

    def load_sheet(self):
        """Loads and cleans the Excel sheet."""
        self.df = pd.read_excel(self.file_path, sheet_name=self.sheet_name)
        self.df.columns = (
            self.df.columns.str.strip()
                        .str.lower()
                        .str.replace(r'\s+', '_', regex=True)
                        .str.replace(r'[^\w]', '', regex=True)
        )

    def clean_data_type(self, value):
        """Cleans and normalizes the 'Data type' column values."""
        if pd.isna(value):
            return None
        return self.DATA_TYPE_MAPPINGS.get(str(value).strip().lower(), None)

    def get_dataframe(self):
        return self.df

