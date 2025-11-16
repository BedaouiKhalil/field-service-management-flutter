# Field Service Management Flutter

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=fff)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Active-success)

**Field Service Management Mobile** is the official mobile application for the Field Service Management Platform.
It allows field agents to manage tasks, interventions, and communicate with the Laravel backend.

----

## 📦 Tech Stack

-Flutter 3.x
-Dart 3.x
-GetX (state management, dependency injection, routing)
-Flutter SVG for vector illustrations
-Material Design 3 ready

----

## 🚀 Features

- Modern, responsive UI (supports light/dark mode)
- Onboarding module with GetX
- Clean architecture: MVC + GetX
- Ready for backend integration via API
- Reusable components in widgets/
- Theme switching with LocaleController

----

## ⚙️ Installation

1. Clone the repository  

```bash
   git clone https://github.com/BedaouiKhalil/field-service-management-flutter.git  
   cd field-service-management-flutter  
```

2. Install dependencies

```bash
   flutter pub get 
```

3. Run the app

```bash
   flutter run
```

------

## 🛠️ Development Workflow

- **main** → Stable production-ready code  
- **develop** → Active development branch  
- **feature/*** → Feature branches (merged into develop)

----

## 📂 Project Structure

lib/
┣ core/
┃ ┣ constants/      # *Colors, texts, API URLs*
┃ ┣ utils/          # *Utility functions*
┃ ┗ services/       # *Global services*
┣ data/
┃ ┣ models/         # *Data classes*
┃ ┣ repositories/   # *Smart data management*
┃ ┗ data_sources/
┃     ┣ remote/     # *API calls*
┃     ┗ local/      # *Local storage*
┣ presentation/
┃ ┣ bindings/       # *GetX bindings*
┃ ┣ controllers/    # *Page logic*
┃ ┣ screens/        # *Application screens/pages*
┃ ┗ widgets/        # *Reusable widgets/components*
┣ config/
┃ ┗ routes.dart     # *Navigation routes*
┗ main.dart         # *Entry point*


----

## 🎨 Theme Management

- Supports light and dark themes
- Controlled reactively via GetX LocaleController:

```bash
   Get.changeTheme(theme);
```

----

## 🔗 Backend Integration
- Backend: Field Service Management Laravel 10
- API Authentication: Sanctum
- Role Management: Spatie Laravel Permission

------

## 📜 License

This project is licensed under the MIT License - see the LICENSE.md file for details.