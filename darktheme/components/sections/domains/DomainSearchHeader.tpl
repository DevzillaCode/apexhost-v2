<div class="home-domain-search">
  <div class="container-fluid">
    <!-- domain-search-content -->
    <div class="domain-search-content text-center">
      <!-- domain-search-title -->
      <h1 class="domain-search-title --text-5xl --font-base --font-semibold">
        {lang key="T_domainSearchText1"} <span class="gradient-text gradient-primary">{lang key="T_domainSearchText2"}</span> {lang key="T_domainSearchText3"}<br class="d-none d-md-block">{lang key="T_domainSearchText4"}
      </h1>
      <!-- search-form -->
      <form method="post" action="domainchecker.php" id="frmDomainHomepage" class="domain-search-form">
        <input type="hidden" name="transfer" />
        <div class="custom-input-group d-flex flex-md-row flex-column align-items-center" data-gap-y="10px">
          <!-- flex-div -->
          <div class="d-flex align-items-center w-100">
            <i class="fad fa-search"></i>
            <input type="text" name="domain" class="custom-input" placeholder="{lang key='exampledomain'}" autocapitalize="none" autocomplete="off">
          </div>
          {if $registerdomainenabled}
            <button type="submit" class="nt-btn nt-btn-default mx-md-0 mx-auto{$captcha->getButtonClass($captchaForm)}" id="btnDomainSearch">{lang key="T_searchDomain"}</button>
          {/if}
        </div>
        {if $transferdomainenabled}
          <!-- default-link -->
          <button type="submit" id="btnTransfer" data-domain-action="transfer" class="nt-btn nt-btn-ghost mx-auto{$captcha->getButtonClass($captchaForm)}">{lang key="T_domainTransfer"}</button>
        {/if}
      </form>
      <!-- captcha -->
      {include file="$template/includes/captcha.tpl"}
    </div>
  </div>
</div>