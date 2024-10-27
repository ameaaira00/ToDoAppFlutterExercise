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

## Deployment to GitHub Pages

To deploy the app to GitHub Pages, follow these steps:

1. **Build the Web App**:
   Make sure to update the `<base href>` in `index.html` located in the `web` folder to match your GitHub Pages URL. For example, if your repository is named `ToDoAppFlutterExercise`, set it as follows:

   ```html
   <base href="/ToDoAppFlutterExercise/">
   ```

   Then run the following command to build the web app:

   ```bash
   flutter build web --base-href /ToDoAppFlutterExercise/
   ```

2. **Create the `gh-pages` Branch**:
   Create a branch specifically for GitHub Pages deployment. From your terminal, run:

   ```bash
   git checkout -b gh-pages
   ```

3. **Move Built Files**:
   Move the contents of the `build/web` directory to the root of the `gh-pages` branch:

   ```bash
   Move-Item -Path ../build/web/* -Destination . -Force
   ```

4. **Commit Changes**:
   Commit the changes to the `gh-pages` branch:

   ```bash
   git add .
   git commit -m "Deploy To-Do List app to GitHub Pages"
   ```

5. **Push to GitHub**:
   Push the `gh-pages` branch to GitHub:

   ```bash
   git push origin gh-pages
   ```

6. **Access the App**:
   Your app will be available at the following link (replace with your actual username and repo name):

   ```
   https://ameaaira00.github.io/ToDoAppFlutterExercise/
   ```

## Contributing

Feel free to submit issues or pull requests. Contributions are welcome!

## License

This project is open-source and available under the [MIT License](LICENSE).