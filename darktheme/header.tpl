<!doctype html>
<html lang="en" data-theme="dark-theme" dir="{if $language eq 'arabic'}rtl{else}ltr{/if}">

<head>
  <meta charset="{$charset}" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>

  <!-- Preconnect early -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

  <!-- Preload the most critical font -->
  <link rel="preload" href="https://fonts.googleapis.com/css2?family=Cairo:wght@200..1000&family=Geist:wght@100..900&family=IBM+Plex+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" as="style" onload="this.onload=null;this.rel='stylesheet'">
  <noscript>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Cairo:wght@200..1000&family=Geist:wght@100..900&family=IBM+Plex+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap">
  </noscript>


  <!-- SEO Meta Tags -->
  <meta name="description" content="{if $kbarticle.seo_description}{$kbarticle.seo_description}{else}{$pagetitle} - {$companyname} Services{/if}">
  <meta name="keywords" content="{if $kbarticle.seo_keywords}{$kbarticle.seo_keywords}{else}{$companyname}, hosting, services, support{/if}">
  <meta name="robots" content="index, follow">
  <meta name="author" content="{$companyname}">

  <!-- Open Graph Tags for Social Media -->
  <meta property="og:title" content="{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}">
  <meta property="og:description" content="{if $kbarticle.seo_description}{$kbarticle.seo_description}{else}{$pagetitle} - {$companyname} Services{/if}">
  <meta property="og:type" content="{if $kbarticle.title}article{else}website{/if}">
  <meta property="og:url" content="{$systemurl}{$smarty.server.REQUEST_URI}">
  <meta property="og:image" content="{$systemurl}/assets/img/og-image.jpg">
  <meta property="og:site_name" content="{$companyname}">

  <!-- Twitter Card Tags -->
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}">
  <meta name="twitter:description" content="{if $kbarticle.seo_description}{$kbarticle.seo_description}{else}{$pagetitle} - {$companyname} Services{/if}">
  <meta name="twitter:image" content="{$systemurl}/assets/img/og-image.jpg">

  <!-- Canonical URL -->
  <link rel="canonical" href="{$systemurl}{$smarty.server.REQUEST_URI}">

  <!-- Favicon -->
  <link rel="icon" href="{$systemurl}/assets/img/favicon.ico" type="image/x-icon">

  <!-- Schema Markup for Organization -->
  <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "Organization",
      "name": "{$companyname}",
      "url": "{$systemurl}",
      "logo": "{$systemurl}/assets/img/logo.png",
      "contactPoint": {
        "@type": "ContactPoint",
        "telephone": "{$companyphone}",
        "contactType": "customer service"
      }
    }
  </script>

  {if $kbarticle.title}
    <!-- Schema Markup for Article -->
    <script type="application/ld+json">
      {
        "@context": "https://schema.org",
        "@type": "Article",
        "headline": "{$kbarticle.title}",
        "description": "{if $kbarticle.seo_description}{$kbarticle.seo_description}{else}{$pagetitle} - {$companyname} Services{/if}",
        "author": {
          "@type": "Organization",
          "name": "{$companyname}"
        },
        "publisher": {
          "@type": "Organization",
          "name": "{$companyname}",
          "logo": {
            "@type": "ImageObject",
            "url": "{$systemurl}/assets/img/logo.png"
          }
        },
        "url": "{$systemurl}{$smarty.server.REQUEST_URI}",
        "datePublished": "{if $kbarticle.date}{$kbarticle.date}{else}{$smarty.now|date_format:'%Y-%m-%d'}{/if}",
        "mainEntityOfPage": {
          "@type": "WebPage",
          "@id": "{$systemurl}{$smarty.server.REQUEST_URI}"
        }
      }
    </script>
  {/if}

  {include file="$template/includes/head.tpl"}
  {$headoutput}
</head>

<body data-phone-cc-input="{$phoneNumberInputStyle}" class="dark-theme">

  {if $captcha}{$captcha->getMarkup()}{/if}
  {$headeroutput}

  {include file="$template/components/shared/Preloader.tpl"}

  {if $templatefile !== 'login' && $templatefile !== 'password-reset-container' && $templatefile !== 'contact'}
    <header id="header" class="header">
      {* Topbar - Only visible for logged-in users *}
      {if $loggedin}
        {include file="$template/components/sections/shared/navbar/TopBar.tpl"}
      {/if}

      {* Main navigation bar *}
      {if $templatefile !== 'login' && $templatefile !== 'password-reset-container' && $templatefile !== 'contact'}
        {include file="$template/components/sections/shared/navbar/Navbar.tpl"}
      {/if}
    </header>
  {/if}

  {include file="$template/includes/network-issues-notifications.tpl"}

  {if $templatefile !== 'homepage' && $templatefile !== 'login' && $templatefile !== 'password-reset-container' && $templatefile !== 'contact'}
    {* Breadcrumbs - Only for non-homepage templates *}
    <nav class="theme-master-breadcrumb" aria-label="breadcrumb">
      <div class="container-fluid">
        {include file="$template/components/breadcrumbs/MasterBreadcrumb.tpl"}
      </div>
    </nav>
  {/if}

  {include file="$template/includes/validateuser.tpl"}
  {include file="$template/includes/verifyemail.tpl"}

  {if $templatefile == 'homepage'}

    {include file="$template/components/sections/headers/QuickActionsHeader.tpl"}
    {* Domain Search & Features - Only if domain services are enabled *}
    {if $registerdomainenabled || $transferdomainenabled}
      {* Main domain search functionality *}
      {* {include file="$template/components/sections/domains/DomainSearchHeader.tpl"} *}
      {* Domain features showcase *}
      {include file="$template/components/sections/domains/DomainsFeatures.tpl"}
    {/if}

    {* Product showcase sections *}
    {include file="$template/components/plans/BasicPlans.tpl"}
    {include file="$template/components/plans/SpecialPlans.tpl"}

    {* Feature highlights *}
    {include file="$template/components/sections/features/FeaturesSection.tpl"}

    {* Hosting solutions showcase *}
    {include file="$template/components/sections/hosting/HostingSolutions.tpl"}

    {* Server locations map *}
    {include file="$template/components/sections/maps/ServersLocations.tpl"}

    {* System announcements *}
    {include file="$template/components/sections/announcements/Announcements.tpl"}

    {* Domains search bar *}
    {include file="$template/components/search/FloatBar.tpl"}
  {/if}

  {* Main body section - Exclude login *}
  {if $templatefile !== 'login' && $templatefile !== 'contact' && $templatefile !== 'password-reset-container'}
    <section id="main-body">
      <div class="{if !$skipMainBodyContainer}container-fluid{/if}">
        <div class="row main-row row-gap-8">

          {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
            <div class="sidebar-col">
              {* Primary sidebar *}
              <div class="sidebar">
                {include file="$template/components/sections/shared/Sidebar.tpl" sidebar=$primarySidebar}
              </div>

              {* Secondary sidebar - Desktop only *}
              {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                <div class="d-none d-lg-block sidebar">
                  {include file="$template/components/sections/shared/Sidebar.tpl" sidebar=$secondarySidebar}
                </div>
              {/if}
            </div>
          {/if}

          <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}content-col{/if} primary-content">
{/if}