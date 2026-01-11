# Field Service Management Flutter

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=fff)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Active-success)

**Field Service Management Mobile** is the official mobile application for the Field Service Management Platform.
It allows field agents to manage tasks, interventions, and communicate with the Laravel backend.

----

## 📦 Tech Stack

- Flutter 3.x
- Dart 3.x
- GetX (state management, dependency injection, routing)
- Flutter SVG for vector illustrations
- GetStorage (local persistence)
- Material Design 3 ready

----

## 🚀 Features

- 🏗️ **Clean Architecture** — Structured using the Repository Pattern.
- 🔐 **Secure Authentication** — Token-based auth powered by Laravel Sanctum.
- 📦 **State Management** — Reactive and predictable UI with GetX.
- 🔌 **Offline First** — Local caching via GetStorage.
- 🎨 **Modern UI** — Material 3 design with Light/Dark mode support.
- 🧠 **Scalability** — Dependency injection and routing handled by GetX Bindings.
- 🌐 **API Layer** — Centralized HTTP client with unified error handling.

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

```text
lib/
├── core/
│   ├── constants/        # App constants (routes, HTTP status, storage keys)
│   ├── services/         # Global services (API, local storage)
│   └── utils/            # Helpers & validators
├── data/
│   ├── models/           # Data models (UserModel, ApiResponse, DTOs)
│   ├── repositories/     # Business logic & data orchestration
│   └── data_sources/
│       ├── remote/       # API calls (AuthRemoteDataSource)
│       └── local/        # Local cache (AuthLocalDataSource)
├── presentation/
│   ├── bindings/         # GetX bindings (dependency injection)
│   ├── controllers/      # UI logic (GetX Controllers)
│   ├── screens/          # Application screens
│   └── widgets/          # Reusable UI components
├── config/
│   └── routes.dart       # Centralized navigation (GetX)
└── main.dart             # Application entry point
```

----

## 🔄 Data Flow Overview

```text
Screen (UI)
   ↓
Controller (GetX)
   ↓
Repository
   ↓
Local Data Source (Cache)
   ↓
Remote Data Source (API)

➡️ Controllers never know where the data comes from (API or cache).
```

----

## 🌐 API & Storage Management

### API

- Centralized HTTP client (ApiService)
- Automatic headers & token injection
- Timeout handling
- Unified request logging

### Local Storage

- Powered by GetStorage
- Abstracted via StorageService

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
- Architecture: REST API

------

## 📜 License

This project is licensed under the MIT License - see the LICENSE.md file for details.