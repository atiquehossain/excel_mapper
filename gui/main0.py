import tkinter as tk
from tkinter import filedialog, messagebox

class StepApp:
    def __init__(self, root):
        self.root = root
        self.step = 1  # Starting step
        
        # Dark Mode Colors
        self.dark_colors = {
            'background': '#1A1A1A',
            'button': '#6666FF',
            'button_hover': '#5555CC',
            'text': '#FFFFFF',
            'header': '#66B2FF',
        }

        self.current_colors = self.dark_colors  # Set initial colors
        
        self.root.title("Step App")

        # Get screen width and height
        screen_width = self.root.winfo_screenwidth()
        screen_height = self.root.winfo_screenheight()

        # Set window size to half the screen width and height
        window_width = screen_width // 2
        window_height = screen_height // 2

        # Set geometry of the window
        self.root.geometry(f"{window_width}x{window_height}")

        # Frame to hold widgets
        self.frame = tk.Frame(self.root, bg=self.current_colors['background'])
        self.frame.pack(fill="both", expand=True)

        # Create first step UI
        self.create_step_1()

    def update_ui(self):
        """Update the UI elements based on the selected theme."""
        self.frame.config(bg=self.current_colors['background'])
        # Refresh step content
        if self.step == 1:
            self.create_step_1()
        elif self.step == 2:
            self.create_step_2()
        elif self.step == 3:
            self.create_step_3()
        elif self.step == 4:
            self.create_step_4()
        elif self.step == 5:
            self.create_step_5()

    def create_step_1(self):
        for widget in self.frame.winfo_children():
            widget.destroy()  # Clear previous widgets

        # Step title
        step_1_label = tk.Label(self.frame, text="Step 1: Excel Select", font=("Helvetica", 24, "bold"), bg=self.current_colors['background'], fg=self.current_colors['header'])
        step_1_label.pack(pady=10)

        # Upload Excel button
        excel_button = tk.Button(self.frame, text="Upload Excel File", command=self.upload_excel, bg=self.current_colors['button'], fg=self.current_colors['text'], relief="flat", padx=20, pady=10)
        excel_button.pack(pady=10)

        # Display file path label
        self.file_path_label = tk.Label(self.frame, text="", bg=self.current_colors['background'], fg=self.current_colors['text'])
        self.file_path_label.pack(pady=10)

        # Next button
        next_button = tk.Button(self.frame, text="Next", command=self.next_step, bg=self.current_colors['button'], fg=self.current_colors['text'], relief="flat", padx=20, pady=10)
        next_button.pack(side="bottom", pady=20)

    def upload_excel(self):
        """Open file dialog to upload Excel file."""
        file_path = filedialog.askopenfilename(filetypes=[("Excel Files", "*.xlsx;*.xls")])
        
        if file_path:
            self.file_path_label.config(text=f"Selected File: {file_path}")
            print(f"Selected Excel File: {file_path}")
            # You can now process the selected Excel file here (e.g., open, read contents)
            self.process_excel(file_path)

    def process_excel(self, file_path):
        """Process the uploaded Excel file (e.g., read its contents)."""
        # Code to process the Excel file (e.g., using pandas or openpyxl) can be added here.
        print(f"Processing file: {file_path}")

    def create_step_2(self):
        for widget in self.frame.winfo_children():
            widget.destroy()  # Clear previous widgets

        step_2_label = tk.Label(self.frame, text="Step 2: Localization", font=("Helvetica", 24, "bold"), bg=self.current_colors['background'], fg=self.current_colors['header'])
        step_2_label.pack(pady=10)

        key_label = tk.Label(self.frame, text="Select Key Column:", bg=self.current_colors['background'], fg=self.current_colors['text'])
        key_label.pack(pady=5)

        key_entry = tk.Entry(self.frame, bg=self.current_colors['background'], fg=self.current_colors['text'])
        key_entry.insert(0, "Column A")
        key_entry.pack(pady=5)

        value_label = tk.Label(self.frame, text="Select Value Column:", bg=self.current_colors['background'], fg=self.current_colors['text'])
        value_label.pack(pady=5)

        value_entry = tk.Entry(self.frame, bg=self.current_colors['background'], fg=self.current_colors['text'])
        value_entry.insert(0, "Column B")
        value_entry.pack(pady=5)

        # Next button
        next_button = tk.Button(self.frame, text="Next", command=self.next_step, bg=self.current_colors['button'], fg=self.current_colors['text'], relief="flat", padx=20, pady=10)
        next_button.pack(side="bottom", pady=20)

    def create_step_3(self):
        for widget in self.frame.winfo_children():
            widget.destroy()  # Clear previous widgets

        step_3_label = tk.Label(self.frame, text="Step 3: Database", font=("Helvetica", 24, "bold"), bg=self.current_colors['background'], fg=self.current_colors['header'])
        step_3_label.pack(pady=10)

        model_label = tk.Label(self.frame, text="Select Model Name:", bg=self.current_colors['background'], fg=self.current_colors['text'])
        model_label.pack(pady=5)

        model_entry = tk.Entry(self.frame, bg=self.current_colors['background'], fg=self.current_colors['text'])
        model_entry.insert(0, "Model A")
        model_entry.pack(pady=5)

        datatype_label = tk.Label(self.frame, text="Select Data Type for Fields:", bg=self.current_colors['background'], fg=self.current_colors['text'])
        datatype_label.pack(pady=5)

        datatype_entry = tk.Entry(self.frame, bg=self.current_colors['background'], fg=self.current_colors['text'])
        datatype_entry.insert(0, "String")
        datatype_entry.pack(pady=5)

        # Next button
        next_button = tk.Button(self.frame, text="Next", command=self.next_step, bg=self.current_colors['button'], fg=self.current_colors['text'], relief="flat", padx=20, pady=10)
        next_button.pack(side="bottom", pady=20)

    def create_step_4(self):
        for widget in self.frame.winfo_children():
            widget.destroy()  # Clear previous widgets

        step_4_label = tk.Label(self.frame, text="Step 4: Data Type Selection", font=("Helvetica", 24, "bold"), bg=self.current_colors['background'], fg=self.current_colors['header'])
        step_4_label.pack(pady=10)

        type_label = tk.Label(self.frame, text="Select Data Type for Values:", bg=self.current_colors['background'], fg=self.current_colors['text'])
        type_label.pack(pady=5)

        type_entry = tk.Entry(self.frame, bg=self.current_colors['background'], fg=self.current_colors['text'])
        type_entry.insert(0, "String")
        type_entry.pack(pady=5)

        next_button = tk.Button(self.frame, text="Next", command=self.next_step, bg=self.current_colors['button'], fg=self.current_colors['text'], relief="flat", padx=20, pady=10)
        next_button.pack(side="bottom", pady=20)

    def create_step_5(self):
        for widget in self.frame.winfo_children():
            widget.destroy()  # Clear previous widgets

        step_5_label = tk.Label(self.frame, text="Step 5: Review & Confirm", font=("Helvetica", 24, "bold"), bg=self.current_colors['background'], fg=self.current_colors['header'])
        step_5_label.pack(pady=10)

        review_label = tk.Label(self.frame, text="Review the Configuration", bg=self.current_colors['background'], fg=self.current_colors['text'])
        review_label.pack(pady=5)

        confirm_button = tk.Button(self.frame, text="Generate UI", command=self.generate_ui, bg=self.current_colors['button'], fg=self.current_colors['text'], relief="flat", padx=20, pady=10)
        confirm_button.pack(side="bottom", pady=20)

    def next_step(self):
        """Handle the logic of moving through steps"""
        if self.step == 1:
            self.create_step_2()
        elif self.step == 2:
            self.create_step_3()
        elif self.step == 3:
            self.create_step_4()
        elif self.step == 4:
            self.create_step_5()
        self.step += 1  # Increment to the next step

    def generate_ui(self):
        """Popup to show that the UI has been generated."""
        messagebox.showinfo("UI Generation", "The UI has been successfully generated!")

# Initialize and run the tkinter app
if __name__ == "__main__":
    root = tk.Tk()
    app = StepApp(root)
    root.mainloop()
