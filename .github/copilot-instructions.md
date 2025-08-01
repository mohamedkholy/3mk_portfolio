# Copilot Instructions for `my_portfolio` (Flutter)

## Project Overview
- This is a Flutter web/mobile portfolio app showcasing personal projects, skills, and contact info.
- Main entry: `lib/main.dart` sets up the app, theme, and navigation between sections using `GlobalKey` for scroll targets.
- Major UI sections are implemented as widgets in `lib/widgets/`:
  - `about_section.dart`: About Me
  - `skills_section.dart`: Skills list
  - `projects_section.dart`: Project cards (uses `models/project.dart`)
  - `contact_section.dart`: Contact options (uses `contact_button.dart`)

## Architecture & Patterns
- Stateless widgets are preferred for UI sections; stateful logic is minimal and mostly in `PortfolioHome`.
- Data for projects and skills is hardcoded in their respective section widgets.
- Custom fonts are loaded via `assets/fonts/` and referenced in `pubspec.yaml` and `ThemeData`.
- All navigation between sections is via scroll/keys, not routes.
- UI uses Material Design, with custom colors and gradients for project cards.
- `Project` model (`models/project.dart`) is a simple data class for project info.

## Developer Workflows
- **Build/Run:**
  - Use standard Flutter commands:
    - `flutter run` (dev server)
    - `flutter build web` (for web output)
    - `flutter build apk` (for Android)
- **Test:**
  - Widget tests in `test/widget_test.dart`.
  - Run with `flutter test`.
- **Debug:**
  - Use Flutter DevTools or VS Code debugging tools.
- **Dependencies:**
  - Managed in `pubspec.yaml`. Run `flutter pub get` after changes.

## Project-Specific Conventions
- All section widgets accept a `GlobalKey` for scroll targeting.
- Project data is defined as a constant list in `projects_section.dart`.
- Skills are defined as a constant list in `skills_section.dart`.
- Contact buttons are created via `ContactButton` widget, which expects `icon` and `label`.
- Font family is set globally in `ThemeData` as `PlusJakartaSans`.
- Asset images and fonts are stored in `assets/` and referenced in `pubspec.yaml`.

## Integration Points
- No backend/API integration; all data is local/static.
- Uses only core Flutter and `cupertino_icons` (see `pubspec.yaml`).
- No platform-specific code or plugins.

## Examples
- To add a new project: update the `_projects` list in `projects_section.dart`.
- To add a new skill: update the `skills` list in `skills_section.dart`.
- To add a new contact method: update the buttons in `contact_section.dart` and ensure `ContactButton` is used.

## Key Files & Directories
- `lib/main.dart`: App entry, navigation, theme
- `lib/widgets/`: All main UI sections
- `lib/models/project.dart`: Project data model
- `assets/`: Fonts and images
- `pubspec.yaml`: Dependencies, assets, fonts

---
If any conventions or workflows are unclear, please provide feedback so this guide can be improved.
