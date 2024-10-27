# To-Do List App
A simple, minimalist To-Do List web application built with Flutter. Users can add and remove tasks, and tasks are saved locally using `SharedPreferences`.

## Purpose
This app was created to help me familiarize myself with Flutter as a beginner. I aim to create more complex applications in the future using this framework.


## Features
- Add new tasks
- Remove tasks
- Persistent storage using local storage
- Clean and minimalist UI

## Getting Started

### Prerequisites

Make sure you have the following installed:

- Flutter SDK
- Dart SDK
- A code editor (like Visual Studio Code or Android Studio)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/todo_list_app.git
   ```

2. Navigate into the project directory:

   ```bash
   cd todo_list_app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

### How to Use

1. Enter a new task in the text field.
2. Press the "+" button or hit Enter to add the task.
3. Click the delete icon next to a task to remove it.

### Local Storage

Tasks are saved locally on your device using the `shared_preferences` package. This allows the tasks to persist even when the app is closed.

## Contributing

Feel free to submit issues or pull requests. Contributions are welcome!

## License

This project is open-source and available under the [MIT License](LICENSE).