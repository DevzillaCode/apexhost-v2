## ApexHost WHMCS Theme — User & Editing Guide

This guide explains how to install, activate, customize, and maintain the ApexHost WHMCS theme (`darktheme`) and its order form (`apex_cart`). It’s structured for quick wins and safe edits.

### What’s Included
- **Client theme**: `templates/darktheme`
- **Order form**: `templates/orderforms/apex_cart`
- **Docs**: `templates/Documentation/`

### Requirements
- WHMCS 8+
- Bootstrap 4, jQuery, Font Awesome (provided by the theme)
  - From `darktheme/theme.yaml`:
    - bootstrap 4.5.3
    - jquery 1.12.4
    - fontawesome 5.10.1
  - From `orderforms/apex_cart/theme.yaml`:
    - bootstrap: 3||4
    - jquery: 1.12
    - fontawesome: 5

## 1) Installation & Activation

### Install the files
- Upload the theme folder to your WHMCS templates path:
  - `templates/darktheme`
  - `templates/orderforms/apex_cart`

### Activate the client theme
- In WHMCS Admin: System Settings → General Settings → General tab → Template → select `darktheme` → Save.

### Activate the order form
- In WHMCS Admin: System Settings → Ordering → Default Order Form Template → select `apex_cart` → Save.

### Clear template cache
- WHMCS Admin: Utilities → System → System Cleanup → Empty Template Cache.

## 2) File Structure (edit safely)

- `darktheme/header.tpl` and `darktheme/footer.tpl`
  - Page shell, meta tags, Open Graph/Twitter, `Preloader`, Navbar, Breadcrumbs.
- `darktheme/includes/head.tpl`
  - Styles and `scripts.js` includes; `custom.css` loads last (safe overrides).
- `darktheme/components/`
  - Reusable UI blocks and homepage sections.
  - Navbar: `components/sections/shared/navbar/` → `Navbar.tpl`, `Links.tpl`, `TopBar.tpl`, `UserDropdownMenu.tpl`.
  - Plans: `components/plans/BasicPlans.tpl`, `components/plans/SpecialPlans.tpl`.
  - Domains features: `components/sections/domains/DomainsFeatures.tpl`.
  - General features: `components/sections/features/FeaturesSection.tpl`.
- `darktheme/css/`
  - `theme.css` (core styles), `custom.css` (your overrides — recommended).
- `darktheme/js/`
  - `theme.js` (dropdowns, navbar responsiveness, floating search, sticky behavior).
- `darktheme/THEME_NOTE.MD`
  - Z-index map, template variables reference, quick notes.
- `orderforms/apex_cart/`
  - The order form UI (checkout, cart, product configuration screens).

## 3) Quick Customizations

### A) Logo, favicon, and SEO basics
- Logo is pulled via `{$assetLogoPath}` in `Navbar.tpl`. Update your logo in WHMCS General Settings or ensure the asset exists.
- Favicon/OG image: update links in `darktheme/header.tpl` if you keep custom paths.
  - `<link rel="icon" href="{$systemurl}/assets/img/favicon.ico">`
  - `<meta property="og:image" content="{$systemurl}/assets/img/og-image.jpg">`

### B) Navbar links and icons
- Edit `darktheme/components/sections/shared/navbar/Links.tpl`.
- Menu entries come from `$primaryNavbar`/`$secondaryNavbar` (WHMCS builds these). The template maps specific item labels to inline SVG icons.
  - To change an icon for a given label, adjust the `{$svgIcons[...]}` map.
  - To add new icons, add a new SVG variable and map it in `svgIcons` using the menu item’s exact label.
- To change menu items (add/remove/reorder), use WHMCS menu management/hooks or edit how the foreach renders items.

### C) Homepage plans (products shown and pricing labels)
- Edit `darktheme/components/plans/BasicPlans.tpl`.
  - Choose which product group to show by changing the group name match:
    - `{if $group.name eq "Shared Hosting"}` → set to your group (e.g., `Web Hosting`).
  - At the top, adjust visible price labels:
    - `basicPlanPrice`, `standardPlanPrice`, `popularPlanPrice`, `premiumPlanPrice`
  - Ensure product names in WHMCS match those checked in the template for price labels (e.g., "Basic", "Standard", "Popular", "Premium").

### D) Special plans block
- Edit `darktheme/components/plans/SpecialPlans.tpl` to change headings, bullets, and sample prices.

### E) Domain features band
- Edit `darktheme/components/sections/domains/DomainsFeatures.tpl`.
  - Replace SVGs or text; keep `{lang ...}` where used, or hardcode text.

### F) Feature highlight cards
- Edit `darktheme/components/sections/features/FeaturesSection.tpl` to change the section title and card content.

### G) CSS theme overrides
- Put your customizations in `darktheme/css/custom.css` (loaded last).
- Good targets: colors, spacing, typography, buttons, cards.

### H) JavaScript behavior
- `darktheme/js/theme.js` handles:
  - Dropdown menus, sticky topbar/navbar, responsive link toggles.
  - Floating domain search bar animation.
  - Sidebar panel toggles.
- You can disable a behavior by removing its handler or scoping via CSS.

## 4) Language and RTL

- The header sets `dir="rtl"` when the language is `arabic`. RTL is supported.
- To change text used via `{lang key=...}`:
  - Use WHMCS language overrides (recommended): `whmcs/lang/overrides/english.php` (or your locale). Do not edit core language files.
  - Alternatively, replace `{lang ...}` with static text in the template.

## 5) Order Form (`apex_cart`)

- Activate in WHMCS Admin → System Settings → Ordering → Default Order Form Template → `apex_cart`.
- Customize visuals via `templates/orderforms/apex_cart/css/` and `templates/orderforms/apex_cart/js/`.
- Card layout and product details are under `templates/orderforms/apex_cart/` `.tpl` files (e.g., `viewcart.tpl`, `configureproduct.tpl`).

## 6) Advanced Notes

### Template variables reference
- See `darktheme/THEME_NOTE.MD` for a compact list of common Smarty variables available (e.g., `{$WEB_ROOT}`, `{$companyname}`, `{$pagetitle}`, `{$primarySidebar}`, etc.).

### Performance/UX
- Preloader can be adjusted via CSS in `custom.css` and include ordering in `header.tpl`.
- `theme.js` recalculates body padding based on topbar/navbar height to avoid content jump.

### SEO and social meta
- Defaults exist in `header.tpl`. Update descriptions, images, and schema.org as desired.

## 7) Best Practices

- **Back up** before editing.
- Prefer **`custom.css`** for style changes and targeted template edits over sweeping rewrites.
- Use **language overrides** for text changes when possible.
- **Clear template cache** after changes.
- **Match product names** in templates to WHMCS names if you rely on conditional price labels.
- Test across devices and dark/light backgrounds.

## 8) Troubleshooting

- **Navbar icon missing**: The label didn’t match an entry in `svgIcons`. Add a mapping or set an icon class on the menu item.
- **Plan price label incorrect**: Product name changed in WHMCS but not reflected in `BasicPlans.tpl` conditionals; sync names or adjust logic.
- **Section not visible**: Some includes only render on homepage or for certain conditions (see `header.tpl`).
- **Cache not refreshing**: Empty template cache and hard-refresh the browser; ensure no server-side opcode cache is holding stale templates.

## 9) Update Strategy

- Keep edits isolated in `custom.css` and minimal `.tpl` changes.
- Document any file you edit so you can reapply changes after theme updates.

## 10) Quick Tasks (copy/paste checklist)

- Change theme and order form templates in Admin.
- Update logo and favicon paths.
- Set homepage product group and visible prices in `BasicPlans.tpl`.
- Edit navbar icons/labels mapping in `Links.tpl`.
- Adjust features text in `DomainsFeatures.tpl` and `FeaturesSection.tpl`.
- Add your CSS in `css/custom.css`.
- Clear template cache.

---

Need help or want us to tailor this theme to your brand? Let us know what to change next and we’ll provide targeted edits.

