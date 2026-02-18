# Texi Driver App

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

Texi Driver is a mobile application developed in Flutter, designed for drivers within the Texi platform. It provides a robust registration and authentication flow, personal information management, and a modern UI adapted to professional driver needs.

## 🚀 Features

- **Driver Registration**: Complete multi-step form for new drivers.
- **Authentication**: Secure login and session management.
- **Internationalization (i18n)**: Support for multiple languages (English, Spanish) and locales (Bolivia, Mexico, Spain).
- **Responsive Design**: Built with `sizer` for consistent UI across different screen sizes.
- **Clean Architecture**: Organized into `data`, `domain`, and `presentation` layers.

## 🛠️ Tech Stack

- **State Management**: [Riverpod](https://riverpod.dev/) (using Notifiers).
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router).
- **Localization**: [i18n_extension](https://pub.dev/packages/i18n_extension) & [phonecodes](https://pub.dev/packages/phonecodes).
- **UI & Layout**: [Sizer](https://pub.dev/packages/sizer).
- **Validation**: [email_validator](https://pub.dev/packages/email_validator).

## 📂 Project Structure

```text
lib/
├── core/               # Shared utilities, themes, widgets, and router
│   ├── lang/           # Localization delegates and extensions
│   ├── router/         # GoRouter configuration
│   ├── theme/          # App styles and themes
│   └── widgets/        # Reusable UI components
├── features/           # Feature-based modular structure
│   ├── auth/           # Login and Authentication feature
│   └── register/       # Driver Registration feature
│       ├── data/       # Models and repositories
│       ├── domain/     # Entities and use cases
│       └── presentation/# Riverpod providers and UI widgets
├── init.dart           # Application entry point (main)
└── main_app.dart       # Root widget and global configuration
```

## 🛠️ Getting Started

### Prerequisites

- Flutter SDK (>= 3.11.0)
- Dart SDK

### Installation

1.  Clone the repository:
    ```bash
    git clone [repository-url]
    ```
2.  Install dependencies:
    ```bash
    flutter pub get
    ```
3.  Run the application:
    ```bash
    flutter run
    ```

## 🌍 Localization

The app uses `i18n_extension`. To add new strings or modify translations, edit:
- `lib/core/lang/extension_lang.dart`

To add/remove supported languages, edit:
- `lib/core/lang/supported_lang.dart`
- `lib/core/lang/delegates_lang.dart`

