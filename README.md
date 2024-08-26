# 🚀 My Personal Projects & Certifications App

This is a personal Flutter application that helps you organize and showcase your projects and certifications. The app features a powerful search function, allowing you to quickly find and view details of projects you've worked on. Additionally, it includes a section for displaying your certifications, which can be viewed directly in the app as PDFs.

## 📱 Features

### 🔍 1. Project Search & Details
- **Search Functionality**: The app includes a search bar that allows you to search through your projects using keywords, similar to Google's search engine.
- **Project Details**: Each project in the list can be clicked to reveal detailed information, including:
  - Project description
  - Technologies used
  - Tools utilized
  - Programming languages
  - Links to related resources (e.g., GitHub repository)
  - Project thumbnail image

### 🎓 2. Certifications Viewer
- **List of Certifications**: The app features a section that displays a list of your certifications.
- **PDF Viewing**: Each certification can be clicked to view the certificate directly within the app as a PDF.

## 🛠️ Technologies Used
- **Flutter SDK**: The core framework for building the app.
- **Provider**: State management solution used for managing app state.
- **Flutter Dotenv**: For managing environment variables.
- **SQLite**: For local storage of project and certification data.
- **PDF Viewer**: A widget for viewing PDFs within the app.
- **HTTP & Caching**: To handle any remote data fetching and caching of images or data.
- **Flutter Local Notifications**: For handling notifications within the app.
- **Other dependencies**: Additional packages to enhance app functionality.

## 🚀 Installation

To run this project locally, clone the repository and run the following commands:

```bash
git clone https://github.com/muuri19/Muuri-App.git
cd Muuri-App
flutter pub get
flutter run
```