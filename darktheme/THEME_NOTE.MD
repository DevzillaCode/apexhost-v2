# z-index:
- master-loader 9999
- theme-topbar 99
- theme-navabr 99
- float-bar-overlay 99
- float-search-bar 100
- theme-footer 101
- alert 102


# HOW TO CHOOSE PRODUCTS TO SHOW AT THE HOME PAGE
1. Change `$group.name` at the `plans.tpl`


# IMPORTANT:
1. Remove the comment form the (blur) props
2. Change the component name to be camelCase.
3. Change the icons js code to work with font icons not only svgs.
4. Create `robots.txt` file
  ->  User-agent: *
      Disallow: /admin/
      Disallow: /cart.php
      Sitemap: {$systemurl}/sitemap.xml
5. Edit status colors.


# DOCUMENTATION
1. How to edit the navbar icons.
2. How to the domains features.
3. How to the home page sections.
4. Change `$group.name` at the `plans.tpl`



# NOTES
1. Fonts Sizes for each website element
  -

{include file="$template/components/sections/Inputs.tpl"}

# TEMPLATE PARAMETERS
1. `{$BASE_PATH_CSS}`   → The base URL to common CSS assets
2. `{$BASE_PATH_FONTS}` → The base URL to common font assets
3. `{$BASE_PATH_IMG}`   → The base URL to common image assets
4. `{$BASE_PATH_JS}`    → The base URL to common JavaScript assets
5. `{$WEB_ROOT}`        → The root URL of the WHMCS installation
6. `{$BASE_PATH}`       → The base path for the current template
7. `{$template}`        → The current template name
8. `{$companyname}`     → The company name set in General Settings
9. `{$charset}`         → The character set (e.g., UTF-8)
10. `{$LANG}`           → The current language array
11. `{$LANG.language}`  → The current language code
12. `{$loggedin}`       → Boolean, true if the user is logged in
13. `{$clientsdetails}` → Array of the logged-in client's details
14. `{$token}`          → CSRF token for forms
15. `{$systemurl}`      → The system URL (base URL for links)
16. `{$filename}`       → The current PHP filename
17. `{$pagetitle}`      → The current page title
18. `{$breadcrumb}`     → The breadcrumb navigation array
19. `{$errormessage}`   → Error message string (if any)
20. `{$successmessage}` → Success message string (if any)
21. `{$templatefile}`   → The current template file name
22. `{$captcha}`        → Captcha HTML (if enabled)
23. `{$announcements}`  → Array of announcements
24. `{$kbarticles}`     → Array of knowledgebase articles
25. `{$kbcats}`         → Array of knowledgebase categories
26. `{$kbmostviews}`    → Array of most viewed KB articles
27. `{$kbpopulartags}`  → Array of popular KB tags
28. `{$twitterusername}`→ Twitter username (if set)
29. `{$twittertweet}`   → Twitter tweet embed code (if set)
30. `{$googleanalytics}`→ Google Analytics code (if set)
31. `{$footeroutput}`   → Footer output (hooks, etc.)
32. `{$headeroutput}`   → Header output (hooks, etc.)
33. `{$primarySidebar}` → Primary sidebar content
34. `{$secondarySidebar}` → Secondary sidebar content
35. `{$mainContent}`    → Main page content
36. `{$sidebar}`        → Sidebar content
37. `{$invoiceid}`      → Current invoice ID (if on invoice page)
38. `{$orderid}`        → Current order ID (if on order page)
39. `{$serviceid}`      → Current service ID (if on service page)
40. `{$domainid}`       → Current domain ID (if on domain page)
41. `{$projectid}`      → Current project ID (if on project page)
42. `{$adminloggedin}`  → Boolean, true if an admin is logged in
43. `{$adminid}`        → Admin user ID (if admin logged in)
44. `{$adminusername}`  → Admin username (if admin logged in)
45. `{$adminemail}`     → Admin email (if admin logged in)
46. `{$adminperms}`     → Array of admin permissions
47. `{$customfields}`   → Array of custom fields (varies by page)
48. `{$addons_html}`    → HTML for product addons (if any)
49. `{$captcha}`        → Captcha HTML (if enabled)
50. `{$recaptchahtml}`  → Google reCAPTCHA HTML (if enabled)

# TEMPLATE INCLUDES
1. Page Title ->  `{include file="$template/components/heading/PageTitle.tpl" headline="{lang key=''}" tagline="{lang key=''}" }`