#  Foxus – Personal Expense Tracker

Foxus is a **Flutter-based expense tracker** designed to be **offline-first with cloud sync**.  
It uses **Hive** for local storage, **Firebase Auth** for secure login, and **Firestore** for backup & multi-device sync.  
The goal is to showcase **clean architecture, BLoC state management, pro UI/UX, and performance best practices**.

---

## 🚀 Features (MVP)
- 📱 Phone authentication with Firebase
-  Expense & income management (CRUD)
-  Monthly dashboard with summary
-  Search & filters (by category, date)
-  Offline-first (Hive) + Firestore sync
-  Light/Dark mode themes
-  CSV export (shareable reports)

---

## 🛠️ Tech Stack
- **Flutter**: 3.22.2 (stable)
- **Dart**: 3.4.0
- **State Management**: `flutter_bloc`
- **Local Storage**: `hive`
- **Cloud Sync**: Firebase Auth + Firestore
- **Routing**: `go_router`
- **Dependency Injection**: `get_it`
- **CI/CD**: GitHub Actions

---

## 📂 Project Structure


lib/
app/
config/ # Environment & constants
router/ # go_router setup, route guards
theme/ # Colors, typography, spacing
di/ # Dependency injection setup
core/ # Errors, results, utils
features/
auth/ # Login, OTP, Auth BLoC
expenses/ # Expense CRUD, list, BLoC
income/ # Income CRUD, list, BLoC
dashboard/ # Summary, charts
export/ # CSV export & sharing
shared/
widgets/ # Reusable UI components
localization/ # Translations
