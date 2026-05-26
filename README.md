# ✨ GlamGo

<p align="center">
  <img src="https://github.com/user-attachments/assets/c996c20e-b1c8-4f2b-a7de-32d29e44ff8a" width="220"/>
</p>

<p align="center">
  <b>Premium Multi-Vendor Salon Booking UI App built with Flutter</b>
</p>

<p align="center">
  Modern appointment booking experience with elegant UI, fluid animations, 
  scalable architecture, and seamless multi-step checkout flows.
</p>

---

# 📱 Overview

**GlamGo** is a premium salon discovery and appointment booking mobile application concept built using Flutter.

The project focuses on:

- Clean architecture
- Feature-first scalability
- Smooth micro-interactions
- Modern mobile UI/UX
- Predictable state management
- Production-style booking flow

The application demonstrates a complete end-to-end booking journey — from discovering salons to confirming appointments.

---

# 🚀 Tech Stack

| Technology | Usage |
|------------|-------|
| **Flutter** | Cross-platform mobile framework |
| **Riverpod** | State management |
| **GoRouter** | Declarative navigation |
| **Flutter Animate** | UI animations & transitions |
| **Firebase** | Backend & booking persistence |

---

# 🏗 Architecture

The project follows a **feature-first scalable architecture**.

```text
lib/
├── core/
├── features/
│   ├── auth/
│   ├── salon/
│   ├── booking/
│   ├── profile/
│   └── home/
├── shared/
└── main.dart
```

### Folder Responsibilities

| Folder | Description |
|--------|-------------|
| `core/` | Themes, routing, constants, shared configs |
| `auth/` | Authentication & OTP flow |
| `salon/` | Salon discovery & profile details |
| `booking/` | Booking flow, scheduling & checkout |
| `profile/` | User profile & booking management |

---

# 🎨 Key Features

- ✨ Modern premium UI
- 📍 Nearby salon discovery
- 👨‍🎨 Staff selection flow
- 📅 Booking & scheduling system
- 🧾 Animated booking confirmation
- 🔥 Firebase-ready architecture
- ⚡ Smooth animations
- 🧠 Riverpod state management
- 🧭 GoRouter navigation flow

---

# 📸 App Screens

## 🔐 Authentication Flow

<p align="center">
  <img src="https://github.com/user-attachments/assets/1d9bd167-0659-4fcb-a620-c67d1eecaf08" width="180"/>
  <img src="https://github.com/user-attachments/assets/030235b8-a4ca-4df0-ab0c-c5fad4ca0406" width="180"/>
  <img src="https://github.com/user-attachments/assets/a1d593d4-838d-4e77-9619-73758bc6ac8c" width="180"/>
</p>

<p align="center">
  Login • OTP Verification • Location Permission
</p>

---

## 🏠 Marketplace & Discovery

<p align="center">
  <img src="https://github.com/user-attachments/assets/c996c20e-b1c8-4f2b-a7de-32d29e44ff8a" width="180"/>
  <img src="https://github.com/user-attachments/assets/728d1d75-5a8f-4859-9306-efa3556fc941" width="180"/>
</p>

<p align="center">
  Home Dashboard • Nearby Salons
</p>

---

## 💇 Booking Flow

<p align="center">
  <img src="https://github.com/user-attachments/assets/8157c8e3-4d78-40d7-beb3-97c0201c11a0" width="160"/>
  <img src="https://github.com/user-attachments/assets/a6de0f4f-2bb3-41d8-8f9f-2504861f7dd3" width="160"/>
  <img src="https://github.com/user-attachments/assets/8a43c2a7-fd01-4b2e-a350-cbde5935cefc" width="160"/>
  <img src="https://github.com/user-attachments/assets/c7c8d73a-2979-42c8-b00c-ebb00c6adf0d" width="160"/>
</p>

<p align="center">
  Salon Detail • Service Selection • Staff Selection • Time Scheduling
</p>

---

## 💳 Checkout & Confirmation

<p align="center">
  <img src="https://github.com/user-attachments/assets/68e29bd2-2b87-4e13-86ef-d2426305cc99" width="180"/>
  <img src="https://github.com/user-attachments/assets/f980bce8-4211-496e-bbde-2056dbca7d8d" width="180"/>
  <img src="https://github.com/user-attachments/assets/30c9bdce-cd55-41ce-ba79-91001a7ac549" width="180"/>
  <img src="https://github.com/user-attachments/assets/a895046d-1e9c-44a8-b9e8-da0797984df0" width="180"/>
</p>

<p align="center">
  Booking Summary • Success Screen • Live Booking Tracking
</p>

---

## 👤 Profile & Booking Management

<p align="center">
  <img src="https://github.com/user-attachments/assets/ca3daf6c-a126-4596-a310-6258e6a16ec1" width="180"/>
  <img src="https://github.com/user-attachments/assets/2debbf99-8ec8-42aa-b836-d0335777121c" width="180"/>
</p>

<p align="center">
  Booking History & Profile Dashboard
</p>

# 🎥 App Preview

https://github.com/user-attachments/assets/5871624b-a3e2-4802-b0dd-a9982b7f2bf8

---

# 🧠 State Management

The app uses **Riverpod** for scalable and predictable state management.

Main booking flow architecture:

```text
UI Screens
    ↓
Riverpod Notifiers
    ↓
Booking State Models
    ↓
Firebase Repository
```

This approach keeps the multi-step booking flow clean, maintainable, and production-ready.

---

# ⚡ Animations

The project heavily uses:

- Fade transitions
- Scale animations
- Hero-style interactions
- Animated success states
- Staggered entrance effects
- Smooth route transitions

Powered by:

```yaml
flutter_animate
```

---

# 🔥 Firebase Integration

The architecture is designed to support:

- Authentication
- Real-time bookings
- Booking history
- Push notifications
- Multi-vendor salon support

---

# 🛠 Getting Started

## 1. Clone Repository

```bash
git clone https://github.com/yourusername/glamgo.git
```

## 2. Open Project

```bash
cd glamgo
```

## 3. Install Dependencies

```bash
flutter pub get
```

## 4. Run Application

```bash
flutter run
```

---

# 📌 Future Improvements

- Online payments
- Real Firebase backend
- Push notifications
- Dark mode
- Maps integration
- Chat system
- Live staff availability
- Ratings & reviews

---

# 👨‍💻 Author

Developed with Flutter for premium mobile UI engineering practice and portfolio presentation by Faizan Ali.

---

# ⭐ Support

If you like this project, consider giving it a star on GitHub ⭐
