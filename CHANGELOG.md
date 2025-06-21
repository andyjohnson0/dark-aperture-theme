# Change Log

## v1.1 - 2025-06-21

Usability:
- Make "new album" and "new photos" flash optional
- Improved EXIF metadata formatting

Photo sharing enhancements
- Add options for sharing via Instagram, Bluesky, Mastodon.
- Change Twitter to X
= Remove vk sharing
- Settings
- Localisation

Localisation:
- Removed some localisations
- Added additional localised strings
- Use double quote rather than apostrophes for delimiting language strings, to reduce need for escaping some characters.
- Fixed apostrophe escaping in string literals
- For exif functions (like flash mode to string) that return a compound string, return a string array so that each string can be translated in smarty.
- Use en_GB instead of en_UK
- Implemented language fallback mapping feature
- Simplified language file naming
- Described languag fallback in README.md

Dependencies and upgrades:
- Upgrade fontawesome from 5.11.2 to 6.7.2 for Bluesky and Instagram icons
- Use Bootstrap buttons instead of Bootstrap-Social

Docs:
- Added screenshot to README.md


## V1 - 2025/01/31

Initial version based on fork of Bootstrap Darkroom theme

Build on Windows in 2025:
- Chnaged package.json scripts for Windows compatibility
- Removed legacy dependencies in node_modules from the repo
- Updated .gitignore to exclude node_modules
- Renamed theme from "Bootstrap Darkroom" to "Dark Aperture"

Updated README.md and comments. Added CHANGELOG.md.

Settings refactoring:
- Grouped related settings
- Terminology: "category" -> "album"

Features and fixes:
- Optionally display photo title below photo
- Enable/disable album titles on main page
- Display additional image metadata below image
- Optional link to theme repo in page footer
- Made "Contact Webmaster" page footer link optional

Updated heme preview screenshots
