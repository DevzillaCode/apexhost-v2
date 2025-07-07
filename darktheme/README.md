# ApexHost WHMCS Theme

## Overview
ApexHost is a modern, customizable WHMCS theme designed for web hosting businesses. It features a clean UI, responsive design, and modular structure for easy editing and maintenance.

## File Structure
- `css/` — All theme stylesheets. Use `custom.css` for your own overrides.
- `js/` — Theme JavaScript. Use `theme.js` for custom scripts.
- `includes/` — Contains reusable components, sections, and templates.
- `images/`, `img/` — Theme images and icons.
- `components/` — UI components (navbar, cards, etc.).
- `sections/` — Homepage and feature sections.

## Editing the Theme

### 1. Homepage Products
- **File:** `includes/sections/products/basic-plans.tpl`
- **How to Edit:**
  - To change which products appear, modify the `$group.name` in the `{foreach $productGroups as $group}` loop. E.g., set to `"Shared Hosting"` or your desired group name.
  - Update plan prices by editing the `{assign var="...PlanPrice" value="..."}` variables at the top.
  - Ensure product names in the template match those in your WHMCS admin for correct price display.

### 2. Navbar Icons & Links
- **Files:**
  - `includes/components/navbar/navbar.tpl` (structure)
  - `includes/components/navbar/links.tpl` (links & icons)
- **How to Edit:**
  - To add or change links, edit the `$primaryNavbar` and `$secondaryNavbar` arrays or their source in your WHMCS admin.
  - To change icons, update the `<i class="fad fa-..."></i>` tags in `links.tpl`. Use [FontAwesome 5.10.1](https://fontawesome.com/v5.10/icons?d=gallery&p=2) icon classes.
  - For dropdowns, ensure the correct structure as shown in `links.tpl`.

### 3. Domain Features Section
- **File:** `includes/sections/domain-search/domains-features.tpl`
- **How to Edit:**
  - Each feature is a block with an icon, title, and description. Edit or add new blocks as needed.
  - Change icons using FontAwesome classes in the `<i class="fad fa-..."></i>` tags.
  - Update text by editing the `{lang key='...'}` or replace with your own text.

### 4. Homepage Features Section
- **File:** `includes/sections/features/features-section.tpl`
- **How to Edit:**
  - Each feature card is a `<div class="basic-features-card">` block. Edit the title and description as needed.
  - Change the section title and description in the `{include ... section-title/regular.tpl ...}` line.

### 5. Custom CSS
- **File:** `css/custom.css`
- **How to Edit:**
  - Add your own CSS rules or override existing ones here. This file is loaded after all other stylesheets.
  - Use CSS variables defined in `:root` for consistent theming.

### 6. Custom JavaScript
- **File:** `js/theme.js`
- **How to Edit:**
  - Add or modify JavaScript for UI interactions here. The file handles dropdowns, navbar toggling, and responsive adjustments.
  - Use the provided functions and follow the event listener patterns for best results.

## Best Practices
- **Backup** files before making changes.
- **Clear cache** after edits to see changes.
- **Test** on multiple devices and browsers.
- **Keep class and ID names** consistent with the theme's structure.

## Additional Notes
- For z-index and stacking context, see `THEME_NOTE.MD`.
- For advanced customization, refer to the comments in each `.tpl`, `.css`, and `.js` file.
- Use the WHMCS admin area to manage product groups and navigation structure for dynamic content.

---
For further support, consult the theme author or your WHMCS documentation.