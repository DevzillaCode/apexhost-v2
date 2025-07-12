<!doctype html>
<html lang="en" data-theme="dark-theme" dir="{if $language eq 'arabic'}rtl{else}ltr{/if}">

<head>
  <meta charset="{$charset}" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
  {include file="$template/includes/head.tpl"}
  {$headoutput}
</head>

<body data-phone-cc-input="{$phoneNumberInputStyle}" class="dark-theme">

  {if $captcha}{$captcha->getMarkup()}{/if}
  {$headeroutput}

  {include file="$template/components/shared/Preloader.tpl"}

  <header id="header" class="header">
    {* Topbar - Only visible for logged-in users *}
    {if $loggedin}
      {include file="$template/components/sections/shared/navbar/TopBar.tpl"}
    {/if}

    {* Main navigation bar *}
    {if $templatefile !== 'login' && $templatefile !== 'register' && $templatefile !== 'passwordreset' && $templatefile !== 'contact'}
      {include file="$template/components/sections/shared/navbar/Navbar.tpl"}
    {/if}
  </header>

  {include file="$template/includes/network-issues-notifications.tpl"}

  {if $templatefile !== 'homepage' && $templatefile !== 'login' && $templatefile !== 'register' && $templatefile !== 'passwordreset' && $templatefile !== 'contact'}
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
    {* {include file="$template/components/sections/header/QuickActionsHeader.tpl"} *}
    {* Domain Search & Features - Only if domain services are enabled *}
    {if $registerdomainenabled || $transferdomainenabled}
      {* Main domain search functionality *}
      {include file="$template/components/sections/domains/DomainSearchHeader.tpl"}
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
  {if $templatefile !== 'login'}
    <section id="main-body">
      <div class="{if !$skipMainBodyContainer}container-fluid{/if}">
        <div class="row main-row">

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