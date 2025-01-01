import pandas as pd
import re
from openpyxl import load_workbook

class ExcelProcessor:
    """Handles processing of the Excel file and data extraction."""
    DATA_TYPE_MAPPINGS = {
        "dropdown": "Dropdown",
        "multiple choice": "Multiple choice",
        "radio": "radio",
        "number": "Number",
        "text": "Text",
        "image": "Image",
    }

    def __init__(self, file_path, sheet_name):
        self.file_path = file_path
        self.sheet_name = sheet_name
        self.df = None

    def load_excel_skip_hidden_rows(self):
        """Load Excel file while skipping hidden rows."""
        # Load the workbook and sheet
        workbook = load_workbook(self.file_path, data_only=True)
        sheet = workbook[self.sheet_name]

        # Identify hidden rows
        hidden_rows = [row for row in sheet.row_dimensions if sheet.row_dimensions[row].hidden]

        # Read the Excel file with pandas
        df = pd.read_excel(self.file_path, sheet_name=self.sheet_name)

        # Drop hidden rows by their index (Excel row numbers are 1-based)
        df = df.drop(index=[row - 1 for row in hidden_rows if row <= len(df)])

        return df

    def load_sheet(self):
        """Loads and cleans the Excel sheet."""
        # Call the load_excel_skip_hidden_rows method within the class
        self.df = self.load_excel_skip_hidden_rows()
        
        # Clean column names: strip, lower, replace spaces with underscores, and remove non-alphanumeric characters
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
        """Returns the processed DataFrame."""
        return self.df



