# 🧾 Flutter Portfolio – Technical Overview

Flutter Web single-page application that demonstrates advanced UI, motion, and deployment patterns. This README focuses on the technical aspects of the project only.

---

## 📚 Key Features

- Animated landing page with hero, experience, projects, skills, and contact sections.
- `MotionBackground` widget for dynamic gradient/glow animation that reacts to scroll.
- `SectionContainer` + `visibility_detector` for scroll-based reveal animations.
- `go_router` for hash-deeplinked navigation plus smooth scrolling.
- `flutter_bloc` `ThemeCubit` driving monochrome light/dark inversion.
- Local data source + domain use cases for clean, testable separation.
- GitHub Actions workflow that builds, tests, and deploys to GitHub Pages.

---

## 🧱 Architecture Snapshot

```
lib/
├── core/
│   └── theme/
│       ├── app_theme.dart        # Material 3 palettes + component theming
│       └── theme_cubit.dart      # BLoC-based theme toggle
├── features/
│   └── portfolio/
│       ├── data/
│       │   ├── datasources/      # PortfolioLocalDataSourceImpl (seed data)
│       │   ├── models/           # DTOs
│       │   └── repositories/     # Repository implementation
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/     # Contracts
│       │   └── usecases/         # GetProjects/GetSkills/GetExperiences
│       └── presentation/
│           ├── pages/            # HomePage entry
│           ├── sections/         # Hero/About/Experience/Projects/Skills/Contact
│           └── widgets/          # Navbar, dividers, motion background, cards
└── main.dart                     # Manual DI + router bootstrap
```

---

## ⚙️ Tech Stack

- **Language:** Dart 3.x  
- **Framework:** Flutter 3.24 (stable)  
- **Routing:** `go_router`  
- **State Management:** `flutter_bloc`, manual DI  
- **Animation:** `flutter_animate`, custom painters  
- **Utilities:** `visibility_detector`, `google_fonts`, `font_awesome_flutter`, `url_launcher`  
- **Testing:** Flutter widget test (smoke test with `VisibilityDetectorController`)  
- **CI/CD:** GitHub Actions → GitHub Pages deploy

---

## 🚀 Getting Started

```bash
git clone https://github.com/<handle>/najeeb_portfolio.git
cd najeeb_portfolio
flutter pub get
flutter run -d chrome
```

### Build for Web

```bash
flutter build web --release --base-href "/portfolio_/"
```

### Run Tests

```bash
flutter test
```

---

## 🧩 Customization Hooks

- **Theme & Palette:** `lib/core/theme/app_theme.dart`
- **Personal copy / sections:** `lib/features/portfolio/presentation/sections/`
- **Data:** `PortfolioLocalDataSourceImpl` or swap in a remote repository
- **Animations:** `MotionBackground`, `hero_section.dart`, and `SectionContainer`

---

## 📦 Deployment Workflow

`.github/workflows/deploy.yml`

1. Trigger: push to `prd` or manual dispatch  
2. Steps: checkout → setup Flutter → `flutter pub get` → `flutter test` → `flutter build web --release`  
3. Upload `build/web` as Pages artifact and deploy via `actions/deploy-pages`

Ensure the `--base-href` matches your GitHub Pages subpath (e.g., `/portfolio_/`) to avoid blank screens.

---

## 📄 License

Released under the [MIT License](LICENSE).
