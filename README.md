![Project Header](assets/images/project-image.jpg)

# Pharmacy App

A modern Flutter application designed for pharmacy management and services. This app provides a seamless interface for users to browse categories, manage their accounts, and interact with pharmacy services.

## How the App Works

The application follows a structured architecture using **GetX** for state management and **Supabase** as the backend service.

### 1. Initialization & Navigation
- **Splash Screen**: The app starts with a splash screen to initialize services and check authentication status.
- **Welcome Screen**: New users are greeted with a welcome screen that introduces them to the app.
- **Authentication**: Users can sign up or sign in using the authentication module. This is powered by Supabase Auth, managed through the `AuthController`.

### 2. Core Modules
- **State Management**: The app uses `GetX` to handle business logic and UI state reactively. Controllers are located in the `lib/controllers` directory.
- **Backend Integration**: Supabase is used for data storage and user authentication. Configuration is handled securely using environment variables via `flutter_dotenv`.
- **UI Components**: The UI is divided into screens (`lib/screens`) and reusable widgets (`lib/widgets`).
- **Data Models**: Structured data models (like `CategoryModel`) ensure type safety when handling data from the backend.

### 3. Features
- User Authentication (Login & Sign Up)
- Category-based browsing
- Secure environment configuration
- Responsive UI design

## Getting Started

To get a local copy up and running, follow these steps:

1. **Clone the repository**
2. **Install dependencies**:
   ```bash
   flutter pub get
   ```
3. **Setup Environment Variables**:
   Create a `.env` file in the root directory and add your Supabase credentials:
   ```env
   SUPABASE_URL=your_supabase_url
   SUPABASE_ANON_KEY=your_supabase_anon_key
   ```
4. **Run the app**:
   ```bash
   flutter run
   ```

---

**Note:** This project is still **under development**. Many features are being actively worked on and improved.
