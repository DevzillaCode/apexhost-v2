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

  {include file="$template/includes/components/preloader.tpl"}

  <header id="header" class="header">
    {* Topbar - Only visible for logged-in users *}
    {if $loggedin}
      {include file="$template/includes/components/topbar/topbar.tpl"}
    {/if}

    {* Main navigation bar *}
    {include file="$template/includes/components/navbar/navbar.tpl"}
  </header>

  {include file="$template/includes/network-issues-notifications.tpl"}

  {if $templatefile !== 'homepage'}
    <nav class="theme-master-breadcrumb" aria-label="breadcrumb">
      <div class="container-fluid">
        {include file="$template/includes/components/breadcrumbs/master.tpl"}
      </div>
    </nav>
  {/if}

  {include file="$template/includes/validateuser.tpl"}
  {include file="$template/includes/verifyemail.tpl"}

  {if $templatefile == 'homepage'}
    {* {include file="$template/components/sections/QuickActionsHeader.tpl"} *}
    {* Domain Search & Features - Only if domain services are enabled *}
    {if $registerdomainenabled || $transferdomainenabled}
      {* Main domain search functionality *}
      {include file="$template/includes/sections/domain-search/domain-search.tpl"}
      {* Domain features showcase *}
      {include file="$template/includes/sections/domain-search/domains-features.tpl"}
    {/if}

    {* Product showcase sections *}
    {include file="$template/includes/sections/products/basic-plans.tpl"}
    {include file="$template/includes/sections/products/special-products.tpl"}

    {* Feature highlights *}
    {include file="$template/includes/sections/features/features-section.tpl"}

    {* Hosting solutions showcase *}
    {include file="$template/includes/sections/HostingSolutions.tpl"}

    {* Server locations map *}
    {include file="$template/includes/sections/ServersLocations.tpl"}

    {* System announcements *}
    {include file="$template/includes/sections/Announcements.tpl"}

    {* Domains search bar *}
    {include file="$template/components/search/FloatBar.tpl"}
  {/if}

  <section id="main-body">
    <div class="{if !$skipMainBodyContainer}container-fluid{/if}">
      <div class="row main-row">

        {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
          <div class="sidebar-col">
            {* Primary sidebar *}
            <div class="sidebar">
              {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
            </div>

            {* Secondary sidebar - Desktop only *}
            {if !$inShoppingCart && $secondarySidebar->hasChildren()}
              <div class="d-none d-lg-block sidebar">
                {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
              </div>
            {/if}
          </div>
        {/if}

<div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}content-col{/if} primary-content">