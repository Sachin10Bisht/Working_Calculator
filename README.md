🧮 Working Calculator
A functional, modern-looking calculator application built with Flutter. This project features a clean "Dark Mode" aesthetic and uses the math_expressions library to handle complex calculations accurately.

✨ Features
Real-time Arithmetic: Perform addition, subtraction, multiplication, and division.

Expression Parsing: Evaluates full mathematical expressions using a robust parser.

Percentage Calculations: Built-in support for percentage-based operations.

Custom UI: Sleek, dark-themed interface with circular buttons and clear visual feedback.

Splash Screen: Includes a dedicated splash screen entry point for a smoother user experience.

Smart Formatting: Results are automatically formatted to hide unnecessary trailing zeros.

🛠️ Tech Stack
Framework: Flutter

Language: Dart

Math Logic: math_expressions package

Icons: Material Design Icons

🚀 Getting Started
Prerequisites
Flutter SDK installed on your machine.

An IDE (VS Code or Android Studio) with Flutter/Dart plugins.

Installation
Clone the repository:

Bash
git clone https://github.com/Sachin10Bisht/Working_Calculator.git
Navigate to the project folder:

Bash
cd Working_Calculator
Install dependencies:

Bash
flutter pub get
Run the app:

Bash
flutter run
📂 Project Structure
lib/calculator.dart: The core dashboard logic and UI implementation.

lib/splashScreen.dart: Initial loading screen.

lib/widgits/CpltRoundBtn.dart: Reusable custom circular button component.

⚙️ How it Works
The app utilizes a TextEditingController to manage the display and a Parser to evaluate the string-based mathematical expressions. It includes a sanitization layer to convert visual symbols (like × and ÷) into computer-readable operators (* and /) before processing.

🤝 Contributing
Contributions are welcome! If you'd like to improve the UI or add more advanced functions (like scientific modes), feel free to fork the repository and submit a pull request.

Created by Sachin10Bisht

