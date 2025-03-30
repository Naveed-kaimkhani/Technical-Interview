# Employee Authentication App

This is a **Flutter** application following the **MVVM** architecture with **GetX** for efficient state management. It supports **Employee Authentication** via Employee ID & OTP, using a **Mock Repository** for testing.

## Features
- **Employee Authentication**: Login via Employee ID & OTP.
- **Mock Authentication**: Simulated login flow for testing.
- **Optimized Performance**: Business logic is handled in controllers to prevent unnecessary UI rebuilds.
- **Clean Code Architecture**: Utilizes repositories for data handling and **Freezed** for robust data models.
- **Efficient Dependency Injection**: Uses `Get.put()` to avoid multiple object creation, enhancing performance.
- **Barrel Files**: Simplifies imports for better code organization.

## Tech Stack
- **State Management**: GetX
- **Architecture**: MVVM (Model-View-ViewModel)
- **Data Models**: Freezed package
- **Authentication**: Mock repository for demonstration

## Project Structure
```
lib/
│-- main.dart  # Entry point of the app
│-- models/    # Freezed models
│-- repositories/
│   │-- auth_repository.dart  # Abstract repository
│   │-- mock_auth_repo.dart   # Mock authentication implementation
│-- controllers/
│   │-- auth_controller.dart  # Handles authentication logic
│-- views/
│   │-- login_screen.dart
│   │-- otp_screen.dart
│-- components/
│-- constants/
```

## Why This Approach?
- **MVVM Architecture**: Ensures a clean separation of concerns.
- **GetX for State Management**: Reduces widget rebuilds, improving performance.
- **Mock Repository**: Enables easy testing without backend dependency.
- **Freezed Models**: Prevents boilerplate and ensures data consistency.

## Switching Between Mock and REST API
The architecture allows switching between **Mock Repository** and a **REST API Repository** by changing a single line of code in `main.dart`. This makes it highly flexible for real-world implementations.

### Example: Switching to a REST API Repository
Modify `main.dart`:
```dart
void main() {
  Get.put<AuthRepository>(MockAuthRepo());  // Switch to RESTAuthRepo when needed
  runApp(MyApp());
}
```
Change `MockAuthRepo()` to `RESTAuthRepo()` when integrating a backend.

## Getting Started
### Prerequisites
- Flutter SDK
- Dart
- VS Code / Android Studio

### Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/your-repo.git
   cd your-repo
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run the app:
   ```sh
   flutter run
   ```

## Contribution Guidelines
1. Fork the repository.
2. Create a new branch (`feature-branch`).
3. Commit your changes (`git commit -m "Added new feature"`).
4. Push to your branch (`git push origin feature-branch`).
5. Create a Pull Request.

## License
This project is licensed under the MIT License.

---
Developed with ❤️ using Flutter & GetX.

