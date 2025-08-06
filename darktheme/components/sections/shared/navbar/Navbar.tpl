<nav class="theme-navbar has-animated-bg float-navbar" id="theme-navbar">
  {* animated-bg *}
  <span class="animated-bg"></span>
  {* container-fluid *}
  <div class="container-fluid">
    <!-- Navbar Content -->
    <div class="navbar-content">
      <!-- Logo -->
      <div class="logo-wrapper d-flex align-items-center col-gap-3">
        <!-- links-toggler -->
        <div class="links-toggler" id="links-toggler">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 17h8m-8-5h14M5 7h8" />
          </svg>
        </div>
        <!-- Logo Link -->
        <a href="{$WEB_ROOT}/index.php" class="logo-link d-flex">
          {if $assetLogoPath}
            <img src="{$assetLogoPath}" class="img-fluid" alt="{$companyname}">
          {else}
            {$companyname}
          {/if}
        </a>
      </div>
      <!-- Links -->
      <div class="links">
        {* close-links *}
        <div class="close-links">
          <button type="button" class="btn-square btn-light btn-circle btn-sm" id="close-links" aria-label="Close">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x-icon lucide-x">
              <path d="M18 6 6 18" />
              <path d="m6 6 12 12" />
            </svg>
          </button>
        </div>
        <!-- Links List -->
        {include file="$template/components/sections/shared/navbar/Links.tpl" navbar=$primaryNavbar}
      </div>
      <!-- Actions -->
      <div class="actions d-flex align-items-center justify-content-end col-gap-2">
        {if !$loggedin}
          <!-- theme-btn -->
          <div class="d-md-block d-none">
            <a href="{$WEB_ROOT}/register.php" class="btn btn-light btn-sm">{lang key='clientregistertitle'}</a>
          </div>
          {* divider *}
          <div class="v-divider"></div>
        {/if}
        <!-- buttons -->
        <div class="d-flex align-items-center col-gap-2">
          {if !$loggedin}
            <!-- lang-btn -->
            <button type="button" class="btn-square btn-ghost-light btn-sm" title="Translate" data-toggle="modal" data-target="#modalChooseLanguage" aria-label="Translate">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="1 1 22 22">
                <path fill="currentColor" d="m19.713 8.128l-.246.566a.506.506 0 0 1-.934 0l-.246-.566a4.36 4.36 0 0 0-2.22-2.25l-.759-.339a.53.53 0 0 1 0-.963l.717-.319a4.37 4.37 0 0 0 2.251-2.326l.253-.611a.506.506 0 0 1 .942 0l.253.61a4.37 4.37 0 0 0 2.25 2.327l.718.32a.53.53 0 0 1 0 .962l-.76.338a4.36 4.36 0 0 0-2.219 2.251M5 17v-2H3v2a4 4 0 0 0 4 4h3v-2H7l-.15-.006A2 2 0 0 1 5 17m17.4 4L18 10h-2l-4.399 11h2.154l1.199-3h4.09l1.201 3zm-6.647-5L17 12.885L18.245 16zM8 4V2H6v2H2v7h4v3h2v-3h4V4zM4 6h2v3H4zm4 0h2v3H8z" />
              </svg>
            </button>
            {* divider *}
            <div class="v-divider"></div>
          {/if}
          <!-- cart-btn -->
          <a href="{$WEB_ROOT}/cart.php?a=view" class="btn-square btn-ghost-light btn-sm {if $cartitemcount > 0}nt-has-red-dot{/if}" title="{if $cartitemcount > 0}You have {$cartitemcount} items in your cart {else}{lang key="carttitle"}{/if}" aria-label="{if $cartitemcount > 0}You have {$cartitemcount} items in your cart {else}{lang key="carttitle"}{/if}">
            <span class="sr-only">{lang key="carttitle"}</span>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
              <path fill="currentColor" fill-rule="evenodd" d="M10 2.25a1.75 1.75 0 0 0-1.582 1c-.684.006-1.216.037-1.692.223A3.25 3.25 0 0 0 5.3 4.563c-.367.493-.54 1.127-.776 1.998l-.047.17l-.513 2.964c-.185.128-.346.28-.486.459c-.901 1.153-.472 2.87.386 6.301c.545 2.183.818 3.274 1.632 3.91C6.31 21 7.435 21 9.685 21h4.63c2.25 0 3.375 0 4.189-.635c.814-.636 1.086-1.727 1.632-3.91c.858-3.432 1.287-5.147.386-6.301a2.186 2.186 0 0 0-.487-.46l-.513-2.962l-.046-.17c-.237-.872-.41-1.506-.776-2a3.25 3.25 0 0 0-1.426-1.089c-.476-.186-1.009-.217-1.692-.222A1.75 1.75 0 0 0 14 2.25h-4Zm8.418 6.896l-.362-2.088c-.283-1.04-.386-1.367-.56-1.601a1.75 1.75 0 0 0-.768-.587c-.22-.086-.486-.111-1.148-.118A1.75 1.75 0 0 1 14 5.75h-4a1.75 1.75 0 0 1-1.58-.998c-.663.007-.928.032-1.148.118a1.75 1.75 0 0 0-.768.587c-.174.234-.277.56-.56 1.6l-.362 2.089C6.58 9 7.91 9 9.685 9h4.63c1.775 0 3.105 0 4.103.146ZM8 12.25a.75.75 0 0 1 .75.75v4a.75.75 0 0 1-1.5 0v-4a.75.75 0 0 1 .75-.75Zm8.75.75a.75.75 0 0 0-1.5 0v4a.75.75 0 0 0 1.5 0v-4ZM12 12.25a.75.75 0 0 1 .75.75v4a.75.75 0 0 1-1.5 0v-4a.75.75 0 0 1 .75-.75Z" clip-rule="evenodd" />
            </svg>
          </a>
          {* divider *}
          <div class="v-divider"></div>
          <!-- User Options Dropdown -->
          <div class="user-options" id="user_options">
            <!-- Theme Button (Profile Toggler) -->
            <button type="button" class="btn-square btn-ghost-light btn-sm" data-type="user_dropdown_menu_toggler" title="Profile" aria-expanded="false" aria-controls="user_dropdown_menu" aria-label="Profile">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                <g fill="none">
                  <path d="M24 0v24H0V0h24ZM12.593 23.258l-.011.002l-.071.035l-.02.004l-.014-.004l-.071-.035c-.01-.004-.019-.001-.024.005l-.004.01l-.017.428l.005.02l.01.013l.104.074l.015.004l.012-.004l.104-.074l.012-.016l.004-.017l-.017-.427c-.002-.01-.009-.017-.017-.018Zm.265-.113l-.013.002l-.185.093l-.01.01l-.003.011l.018.43l.005.012l.008.007l.201.093c.012.004.023 0 .029-.008l.004-.014l-.034-.614c-.003-.012-.01-.02-.02-.022Zm-.715.002a.023.023 0 0 0-.027.006l-.006.014l-.034.614c0 .012.007.02.017.024l.015-.002l.201-.093l.01-.008l.004-.011l.017-.43l-.003-.012l-.01-.01l-.184-.092Z" />
                  <path fill="currentColor" d="M12 13c2.396 0 4.575.694 6.178 1.671c.8.49 1.484 1.065 1.978 1.69c.486.616.844 1.352.844 2.139c0 .845-.411 1.511-1.003 1.986c-.56.45-1.299.748-2.084.956c-1.578.417-3.684.558-5.913.558s-4.335-.14-5.913-.558c-.785-.208-1.524-.506-2.084-.956C3.41 20.01 3 19.345 3 18.5c0-.787.358-1.523.844-2.139c.494-.625 1.177-1.2 1.978-1.69C7.425 13.694 9.605 13 12 13Zm0-11a5 5 0 1 1 0 10a5 5 0 0 1 0-10Z" />
                </g>
              </svg>
            </button>
            <!-- User Dropdown Menu -->
            <div class="theme-dropdown-menu user-dropwon-menu" id="user_dropdown_menu" aria-labelledby="user_options" role="menu">
              {include file="$template/components/sections/shared/navbar/UserDropdownMenu.tpl" navbar=$secondaryNavbar}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</nav>