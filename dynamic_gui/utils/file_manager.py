import os
import requests
import pandas as pd
from tkinter import messagebox

class FileManager:
    def __init__(self, upload_dir='data/upload_files'):
        self.upload_dir = upload_dir
        os.makedirs(upload_dir,exist_ok=True)
        
    
    def upload_from_pc(selfm file_path):

        if os.path.isfile(file_path):
            file_name = os.path.basename(file_path)
            destination = os.path.join(self.upload_dir , file_name)
            os.rename(file_path , destination)
            return destination
        else
            return None
    
    def download_from_google_sheet(self, google_link):
        try:
            file_id = google_link.split("/d/")[1].split("/")[0]
            download_url = f"https://drive.google.com/uc?id={file_id}&export=download"
            if response.status_code == 200:
                file_name = f"google_sheets_{file_id}.xlsx"
                file_path = os.path.join(self.upload_dir, file_name)
                
                with open(file_path, 'wb') as file:
                    file.write(response.content)
                return file_path
            else:
                return None
        except Exception as e:
            print(f"Error downloading Google Sheets: {e}")
            return None
    
    def get_sheet_names(self, file_path):
        """Return the sheet names from an Excel file."""
        try:
            # Load Excel file and return sheet names
            excel_file = pd.ExcelFile(file_path)
            return excel_file.sheet_names
        except Exception as e:
            print(f"Error reading Excel file: {e}")
            return []
