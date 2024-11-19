import tkinter as tk
from tkinter import ttk, filedialog, messagebox
import pandas as pd


def upload_file():
    """Handles file upload and populates the initial dropdown values."""
    file_path = filedialog.askopenfilename(
        title="Select an Excel File",
        filetypes=(("Excel files", "*.xlsx *.xls"), ("All files", "*.*"))
    )
    if file_path:
        label_file["text"] = f"Selected File: {file_path}"
        try:
            # Read the Excel file
            df = pd.read_excel(file_path, header=None)

            # Extract the first row as dropdown options
            global dropdown_values
            dropdown_values = df.iloc[0].dropna().tolist()  # Drop empty values if any

            # Create additional dropdowns based on the first row data
            global excel_data
            excel_data = df.dropna(axis=0, how='all').reset_index(drop=True)  # Remove empty rows
            # Clear existing rows and create the first one
            for widget in dropdown_frame.winfo_children():
                widget.destroy()
            create_row()

            status_label["text"] = "File loaded successfully. Dropdowns are ready!"
        except Exception as e:
            status_label["text"] = "Error reading file."
            messagebox.showerror("Error", f"Failed to read the file: {e}")


def create_row():
    """Adds a new row with key and value dropdowns and a plus button."""
    # Create a new row frame
    row_frame = ttk.Frame(dropdown_frame)
    row_frame.pack(fill="x", pady=5)

    # Key dropdown (always the first one in the row)
    key_var = tk.StringVar(value="Select a value")
    key_dropdown = ttk.OptionMenu(row_frame, key_var, "Select a value", *dropdown_values)
    key_dropdown.grid(row=0, column=0, padx=5, pady=5, sticky="ew")

    # Value   (this will be the first value column)
    value_var = tk.StringVar(value="Select a value")
    value_dropdown = ttk.OptionMenu(row_frame, value_var, "Select a value", *dropdown_values)
    value_dropdown.grid(row=0, column=1, padx=5, pady=5, sticky="ew")

    # Plus button to add a new column for the next value dropdown
    plus_button = ttk.Button(row_frame, text="+", command=lambda: add_value_column(row_frame), width=2)
    plus_button.grid(row=0, column=2, padx=5, pady=5)


def add_value_column(row_frame):
    """Adds a new dropdown for value and moves the plus button."""
    # Add a new Value dropdown in the next column
    new_value_var = tk.StringVar(value="Select a value")
    new_value_dropdown = ttk.OptionMenu(row_frame, new_value_var, "Select a value", *dropdown_values)
    last_column = len(row_frame.grid_slaves(row=0)) - 1  # Last column (the + button column)
    new_value_dropdown.grid(row=0, column=last_column, padx=5, pady=5, sticky="ew")

    # Remove the old plus button
    for widget in row_frame.grid_slaves(row=0, column=last_column + 1):
        widget.grid_forget()

    # Move the plus button to the rightmost column (next to the new value dropdown)
    plus_button = ttk.Button(row_frame, text="+", command=lambda: add_value_column(row_frame), width=2)
    plus_button.grid(row=0, column=last_column + 1, padx=5, pady=5)


def  create_app():
    """Creates the main application window."""
    # Create the main Tkinter window
    root = tk.Tk()
    root.title("Dropdown Table with Add Columns")
    root.geometry("600x400")
   # root.resizable(False, False)

    # Apply styling
    style = ttk.Style()
    style.configure("TButton", font=("Helvetica", 12), padding=5)
    style.configure("TLabel", font=("Helvetica", 12))
    style.configure("TOptionMenu", font=("Helvetica", 12), padding=5)

    # Main frame for content
    main_frame = ttk.Frame(root, padding=20)
    main_frame.pack(fill="both", expand=True)

    # Title label
    title_label = ttk.Label(
        main_frame, text="Dynamic Columns with Dropdowns", font=("Helvetica", 16, "bold")
    )
    title_label.pack(pady=10)

    # File upload button
    btn_upload = ttk.Button(main_frame, text="Upload Excel File", command=upload_file)
    btn_upload.pack(pady=10)

    # Label to display selected file
    global label_file
    label_file = ttk.Label(main_frame, text="No file selected", foreground="gray")
    label_file.pack(pady=5)

    # Table header
    header_frame = ttk.Frame(main_frame)
    header_frame.pack(fill="x", pady=5)
    ttk.Label(header_frame, text="Dropdown (Key)", font=("Helvetica", 12, "bold")).grid(row=0, column=0, padx=5)
    ttk.Label(header_frame, text="Dropdown (Value)", font=("Helvetica", 12, "bold")).grid(row=0, column=1, padx=5)

    # Frame to hold dropdown rows
    global dropdown_frame
    dropdown_frame = ttk.Frame(main_frame)
    dropdown_frame.pack(fill="both", expand=True, pady=10)

    # Status label
    global status_label
    status_label = ttk.Label(main_frame, text="", foreground="green")
    status_label.pack(pady=5)

    # Add the first row initially
    create_row()

    # Run the Tkinter event loop
    root.mainloop()


# Global variable to hold dropdown values
dropdown_values = []
excel_data = []

if __name__ == "__main__":
    create_app()
