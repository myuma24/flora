# Agent Instructions

- The user will often be making changes to the codebase while the agent is coding.
- **DO NOT** make changes that the user has made, and do not overwrite or undo user edits.
- **DO NOT** make assumptions or introduce layout/styling changes (e.g., switching from Row to Column, changing how widgets are visually structured) unless explicitly requested. Stick strictly to the user's established layout design.

## Design System & Icons
- Use the `AppIcon` widget (`lib/core/widgets/app_icon.dart`) instead of standard Material Icons or manually styling SVG containers.
- `AppIcon` handles borders, dynamic alert dots (`alert: true`), and background colors automatically.
- When adding new SVGs, export them from Figma, strip the background/borders, and ALWAYS run `python scripts/crop_svgs.py` to correctly crop the padding down to a standard 24x24 viewBox.
- See the `manage_flora_icons` skill for detailed instructions.

## Typography & Text Styles
- Always use the `AppTextStyles` class (`lib/core/theme/app_text_styles.dart`) for typography instead of calling `GoogleFonts` or `TextStyle` directly.
- Most text specifications from Figma should be built by finding the closest base `AppTextStyles` profile and then using `.copyWith(...)` to apply specific modifiers (e.g., `fontWeight`, `color`, or `height`).
- Example: `AppTextStyles.subBodySans.copyWith(fontWeight: FontWeight.w500, color: AppColors.floraBlack)`
