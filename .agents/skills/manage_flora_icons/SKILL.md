---
name: manage_flora_icons
description: How to process, export, and use custom SVG icons in the Flora app using the AppIcon design system.
---

# Managing Flora Icons

## How Icons Work in Flora
The Flora app uses a unified `AppIcon` widget (`lib/core/widgets/app_icon.dart`) instead of raw SVG files or standard Material Icons.
The `AppIcon` component handles the circular background, borders, and dynamic red "alert" dots automatically.

### Figma Exports vs App Assets
1. When exporting SVGs from Figma, they often come baked with circular background `<rect>` tags and fixed viewBoxes (like 40x40 or 24x24).
2. **DO NOT** use these SVGs directly!
3. To add a new icon:
   - Export the base SVG from Figma (prefer the `Size=Default`, `Alert=Default` variant).
   - Strip out any `<rect>` background or border tags.
   - Save the raw path SVG into `assets/icons/<icon_name>.svg`.
   - Run the `python scripts/crop_svgs.py` script from the project root! This script will automatically calculate the mathematical offsets to perfectly crop the Figma canvas padding down to a standard `24x24` viewBox window, keeping paths perfectly centered and flawlessly sized for the `AppIcon` component.

### Using the AppIcon Widget
Always use the `AppIcon` widget for UI controls instead of manually building `Container` + `SvgPicture`.

```dart
import 'package:flora/core/widgets/app_icon.dart';

// Default circular button (40x40 container with default stroke border)
AppIcon("chevron")

// Without a border (useful for overlays on images)
AppIcon("share", strokeColor: Colors.transparent)

// Adding a notification/alert dot dynamically
AppIcon("bell", alert: true)

// Small size variant (24x24)
AppIcon("minus", size: AppIconSize.small)
```

**CRITICAL:** Never hardcode background containers around raw SVGs or use Material `Icons.*` when a brand icon is available. If an SVG icon requires an alert dot, use the `alert: true` parameter rather than exporting an alternate SVG with the dot baked in.
