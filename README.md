# 🚀 Najeeb - Flutter Portfolio 

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-blue?style=for-the-badge&logo=flutter" />
  <img src="https://img.shields.io/badge/Dart-3.x-blue?style=for-the-badge&logo=dart" />
  <img src="https://img.shields.io/badge/Clean%20Architecture-SOLID-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Platform-Web%20%7C%20Android%20%7C%20iOS-green?style=for-the-badge" />
</p>

<p align="center">
  <b>A minimal, elegant, and performance-engineered Flutter portfolio crafted to reflect high-standards of UI/UX, architecture, and animation design.</b>
</p>

---

## 🎯 Overview

This is not just a portfolio — it's a **technical art piece** designed to demonstrate:

- **Engineering discipline**
- **Architectural clarity**
- **Scalable UI patterns**
- **Animations that feel smooth and premium**
- **Performance thinking in every layer**

Built with **Clean Architecture**, responsive layouts, custom animations, and optimized rendering, this project represents how I approach professional Flutter development.

---

## 🎨 Design & Aesthetic Direction

<p align="center"><b>Minimal. Elegant. Professional. Fast.</b></p>

### ✨ Light Theme
- Soft neutral background (`#F7F9FC`)
- Professional colors with high readability
- Clean spacing & airy layouts

### 🌙 Dark Theme
- Cinematic depth using `#0E1217 → #161B22`
- Electric blue accents for a tech-forward vibe
- High-contrast, premium feel

### 🏷️ Branding
- **Logo**: Custom modern "N" with a metallic/silver finish
- **Background**: Solid black for maximum contrast and premium aesthetic
- **Iconography**: Generated for all platforms (Android, iOS, Web) using `flutter_launcher_icons`

---

## 🧠 Architecture Diagram

### Clean Architecture (Feature-first)
```
lib/
 ├── core/
 │    ├── theme/
 │    ├── utils/
 │    └── widgets/
 ├── data/
 │    ├── datasources/
 │    ├── models/
 │    └── repositories/
 ├── features/
 │    ├── home/
 │    ├── projects/
 │    ├── experience/
 │    ├── skills/
 │    └── contact/
 ├── router/
 └── shared/
```

### Flow
```
UI Widgets
   ↓
State / ViewModel
   ↓
Repositories
   ↓
Local Datasource
```


## 🔥 Key Features

| Feature | Description |
|---------|-------------|
| **Dynamic Project Showcase** | Parallax cards, rich descriptions, GitHub links |
| **Experience Timeline** | Clean animated timeline with roles, periods & achievements |
| **Skill Matrix** | Curated skill groups reflecting real expertise |
| **Dark/Light Mode** | Smooth theme transitions with custom colors |
| **Custom Animations** | Staggered list reveals, fade+slide transitions, scale interactions |
| **Performance Optimized** | Cached images, Lazy rendering, Stateless-first strategy |
| **Clean Architecture** | Feature separation, local datasource, scalable patterns |

---

## 🛠️ Tech Stack

<div align="center">

| Category | Tools |
|----------|-------|
| **Framework** | Flutter |
| **Language** | Dart |
| **Navigation** | GoRouter |
| **State Mgmt** | Provider / BLoC (flexible) |
| **Icons** | FontAwesome |
| **Rendering** | CachedNetworkImage |
| **Architecture** | Clean Architecture, MVVM |
| **UI** | Custom transitions, responsive layout |

</div>

---

## 📦 Local Data Source Structure

All portfolio content is sourced from structured models:

- `ProjectModel`
- `SkillModel`
- `ExperienceModel`

This ensures easy expansion and maintainable UI rendering.

---

## 🚀 Running the Project

### 1. Clone repository
```bash
git clone https://github.com/muhammednajeebay/flutter_portfolio.git
cd flutter_portfolio
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Run the app
```bash
flutter run
```

### 4. Build for production
```bash
flutter build web
flutter build apk
```

---

## 🧭 Roadmap

- [x] Add interactive case-study screens with diagrams
- [x] Implement analytics for project engagement
- [x] Add language selector for international visitors

---

## 👨‍💻 Author

**Muhammed Najeeb A Y**  
*Flutter Developer | Architecture • Performance • UI Systems*

- 🌐 Portfolio: [https://najeebay.netlify.app](https://najeebay.netlify.app)
- 🐙 GitHub: [https://github.com/muhammednajeebay](https://github.com/muhammednajeebay)
- 🔗 LinkedIn: [https://linkedin.com/in/muhammednajeebay](https://linkedin.com/in/muhammednajeebay)

---

## ⭐ Support

If you find the project inspiring or useful:

**Give it a star ⭐ on GitHub** — it motivates future creations!