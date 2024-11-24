import tkinter as tk
from tkinter import ttk, filedialog, messagebox
import pandas as pd
import re


def generate_dart_files(file_path, sheet_name):
    try:
        # Read the specified sheet
        df = pd.read_excel(file_path, sheet_name=sheet_name)

        # Clean column names
        df.columns = df.columns.str.strip()

        # Convert the sheet name to a valid Dart class name
        class_name = re.sub(r'[^\w]+', '_', sheet_name).title().replace("_", "")

        # Dart code template for the stateful widget
        dart_template = f"""
import 'package:flutter/material.dart';
import 'languages.dart';

class {class_name}Widget extends StatefulWidget {{
  @override
  _{class_name}WidgetState createState() => _{class_name}WidgetState();
}}

class _{class_name}WidgetState extends State<{class_name}Widget> {{
  @override
  Widget build(BuildContext context) {{
    return Column(
      children: [
        {{widgets}}
      ],
    );
  }}
}}
"""

        # Dart model class template
        model_template = f"""
class {class_name}Model {{
  {{fields}}

  {class_name}Model({{
    {{constructor_params}}
  }});

  factory {class_name}Model.fromJson(Map<String, dynamic> json) {{
    return {class_name}Model(
      {{from_json}}
    );
  }}

  Map<String, dynamic> toJson() {{
    return {{
      {{to_json}}
    }};
  }}
}}
"""

        # Initialize Dart widget code and model fields
        dart_widgets = []
        model_fields = []
        constructor_params = []
        from_json = []
        to_json = []

        # Process each row in the sheet
        for _, row in df.iterrows():
            data_type = row.get('Data type', None)
            model = row.get('Database', None)

            # Ensure required fields are present
            if pd.isna(data_type) or pd.isna(model):
                continue

            dart_type = "String"  # Default data type

            # Add to Dart model fields
            model_fields.append(f"final {dart_type} {model};")
            constructor_params.append(f"this.{model},")
            from_json.append(f"{model}: json['{model}'],")
            to_json.append(f"'{model}': {model},")

        # Combine widgets into Dart class
        dart_code = dart_template.replace("{widgets}", "\n".join(dart_widgets))

        # Combine fields into Dart model class
        model_code = model_template.replace("{fields}", "\n  ".join(model_fields))
        model_code = model_code.replace("{constructor_params}", "\n    ".join(constructor_params))
        model_code = model_code.replace("{from_json}", "\n      ".join(from_json))
        model_code = model_code.replace("{to_json}", "\n      ".join(to_json))

        # Save Dart files
        widget_filename = f"{sheet_name.lower()}_ui_widget.dart"
        with open(widget_filename, "w", encoding="utf-8") as f:
            f.write(dart_code)

        model_filename = f"{sheet_name.lower()}_model.dart"
        with open(model_filename, "w", encoding="utf-8") as f:
            f.write(model_code)

        messagebox.showinfo("Success", "Dart files generated successfully!")
    except Exception as e:
        messagebox.showerror("Error", f"Failed to generate files: {e}")


def upload_file():
    file_path = filedialog.askopenfilename(filetypes=[("Excel files", "*.xlsx")])
    if file_path:
        try:
            sheets = pd.ExcelFile(file_path).sheet_names
            sheet_selector["values"] = sheets
            sheet_selector.file_path = file_path
            messagebox.showinfo("File Uploaded", "File uploaded successfully!")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to read Excel file: {e}")


def generate_files():
    file_path = getattr(sheet_selector, "file_path", None)
    sheet_name = sheet_selector.get()
    if not file_path or not sheet_name:
        messagebox.showerror("Error", "Please upload a file and select a sheet.")
        return

    generate_dart_files(file_path, sheet_name)


# Tkinter GUI setup
root = tk.Tk()
root.title("Dart File Generator")
root.geometry("500x300")

# Styles
style = ttk.Style()
style.configure("TFrame", background="#f7f7f7")
style.configure("TLabel", background="#f7f7f7", font=("Arial", 12))
style.configure("TButton", font=("Arial", 12))
style.configure("TCombobox", font=("Arial", 12))

# Main frame
main_frame = ttk.Frame(root, padding=20)
main_frame.pack(fill=tk.BOTH, expand=True)

# File upload section
upload_frame = ttk.Frame(main_frame)
upload_frame.pack(fill=tk.X, pady=10)

upload_label = ttk.Label(upload_frame, text="Step 1: Upload an Excel File")
upload_label.pack(side=tk.LEFT, padx=10)

upload_btn = ttk.Button(upload_frame, text="Upload", command=upload_file)
upload_btn.pack(side=tk.RIGHT, padx=10)

# Sheet selection section
sheet_frame = ttk.Frame(main_frame)
sheet_frame.pack(fill=tk.X, pady=10)

sheet_label = ttk.Label(sheet_frame, text="Step 2: Select a Sheet")
sheet_label.pack(side=tk.LEFT, padx=10)

sheet_selector = ttk.Combobox(sheet_frame, state="readonly")
sheet_selector.pack(side=tk.RIGHT, padx=10)

# Generate button
generate_btn = ttk.Button(main_frame, text="Generate Dart Files", command=generate_files)
generate_btn.pack(pady=20)

# Footer
footer = ttk.Label(main_frame, text="Developed by [Your Name]", font=("Arial", 10), anchor=tk.CENTER)
footer.pack(side=tk.BOTTOM, pady=10)

# Run the application
root.mainloop()
