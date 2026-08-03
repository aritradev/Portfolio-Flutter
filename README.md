# Portfolio-Flutter

This repository contains a polished personal portfolio built with Flutter and GetX. The app is designed to present Aritra Dev Tirtha’s profile in a professional, recruiter-friendly way with a premium visual style, animated interactions, and a warm light/dark theme system.

![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-02569B?logo=flutter&logoColor=white)
![GetX](https://img.shields.io/badge/GetX-State%20Management-8A2BE2)
![License](https://img.shields.io/badge/License-Private-lightgrey)

## Overview

This project is a single-page portfolio experience that highlights:

- A strong hero section with a profile picture pulled from GitHub.
- A warm, premium visual system with refined light and dark modes.
- Animated skills, projects, and contact sections.
- Recruiter-focused copy based on the public GitHub profile and README.
- Mobile-first layout with responsive behavior for larger screens.

The design aims to feel less like a default Flutter template and more like a curated personal brand page.

## Live Demo

View the deployed site here:

- https://aritradev.github.io/Portfolio-Flutter/

## Repository

- Owner: `aritradev`
- Repository: `Portfolio-Flutter`
- Default branch: `main`

## Live Content Snapshot

The portfolio is based on Aritra’s public GitHub profile and repository content:

- B.Sc. in Computer Science & Engineering at International Islamic University Chittagong (IIUC).
- 1200+ solved problems across competitive programming platforms.
- 50+ online contests.
- Codeforces Pupil rating.
- Experience and projects across Flutter, React / Next.js, C++, .NET, machine learning, and system design.

## Features

- Premium hero section with profile image and strong positioning.
- GitHub avatar fallback for the profile picture.
- Theme toggle with polished light and dark modes.
- Warm light palette inspired by a chocolate / truffle color system.
- Animated skill chips with category filtering.
- Animated project cards with hover and tap emphasis.
- Contact cards for email, GitHub, LinkedIn, and Codeforces.
- Responsive layout that scales from mobile to desktop.

## Visual Direction

The current visual style uses:

- Light mode: cream background, chocolate text, warm orange accent, soft layered surfaces.
- Dark mode: espresso background, cocoa surfaces, warm borders, cream text.
- Rounded cards and pill controls.
- Subtle shadows, gradients, and premium spacing.

## Tech Stack

- Flutter
- GetX
- url_launcher
- Material 3

## Project Structure

```text
lib/
  main.dart
  controllers/
    portfolio_controller.dart
    theme_controller.dart
  models/
    project.dart
    skill.dart
  theme/
    app_theme.dart
  views/
    home_view.dart
  widgets/
    animated_avatar.dart
    animated_project_card.dart
    animated_skill_chip.dart
    theme_toggle_button.dart
```

## Getting Started

### Prerequisites

- Flutter SDK 3.x or later
- Dart SDK 3.x
- A device, emulator, or Chrome for web preview

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

For web:

```bash
flutter run -d chrome
```

## Assets

The project supports local images in `assets/images/`. The hero avatar currently uses the GitHub profile image fallback, but you can replace it with a local portrait by adding one at:

```text
assets/images/profile.jpg
```

## Data Sources

The portfolio content is informed by Aritra’s public GitHub profile and repository README, including:

- Education and CGPA information.
- Competitive programming stats.
- Featured technology stack.
- Contact links and social profiles.
- Featured projects.

## Contact

- Email: aritradev3333@gmail.com
- GitHub: https://github.com/aritradev
- LinkedIn: https://www.linkedin.com/in/aritradev/
- Codeforces: https://codeforces.com/profile/Ari.

## Notes for Customization

- Update `lib/models/project.dart` to change featured projects.
- Update `lib/models/skill.dart` to adjust skills or categories.
- Update `lib/views/home_view.dart` to revise the profile copy and section ordering.
- Update `lib/theme/app_theme.dart` if you want a different color direction.

## Why This Portfolio Works

The app is intentionally concise and presentation-focused. It surfaces the most relevant information quickly, uses a premium visual language, and keeps interactions subtle so the content remains the priority.

## Credits

Built by Aritra Dev Tirtha using Flutter and GetX.
