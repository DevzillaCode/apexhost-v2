{assign var="assetPath" value="{$WEB_ROOT}/templates/{$template}/images/"}
<div class="providerLinkingFeedback"></div>

<div class="auth-page">
  <div class="video-bg-wrapper">
    <video autoplay muted loop playsinline class="bg-video">
      <source src="{$WEB_ROOT}/templates/{$template}/videos/bg.mp4" type="video/mp4" />
      Your browser does not support the video tag.
    </video>
    <div class="video-overlay-blur"></div>
  </div>

  <div class="container-fluid">
    <div class="page-content d-flex align-items-center justify-content-center flex-column w-100">
      <form method="post" action="{routePath('password-reset-validate-email')}" class="nt-auth-form" role="form">

        {* Logo *}
        <div class="logo-container text-center mb-6">
          <img src="{$assetPath}logo.png" class="img-fluid logo" alt="{$companyname}">
        </div>

        {* Form Header *}
        <div class="form-header mb-10 text-center">
          <h1 class="title-3 color-foreground font-weight-semibold mb-2">{lang key='pwreset'}</h1>
          <p class="text-size-base">{lang key='pwresetemailneeded'}</p>
        </div>

        {* Flash Message or Error *}
        {if $errorMessage}
          {include file="$template/includes/alert.tpl" type="error" msg=$errorMessage}
        {/if}

        {* Form Body *}
        <div class="form-body d-flex flex-column gap-4">

          {* Email Address Field *}
          <div class="form-group">
            <label for="inputEmail" class="form-label">{lang key='loginemail'}</label>
            <input type="email" class="form-control" name="email" id="inputEmail" placeholder="name@example.com" autofocus autocomplete="off">
          </div>

          {* Captcha if Enabled *}
          {if $captcha->isEnabled()}
            {include file="$template/includes/captcha.tpl"}
          {/if}

          {* Submit Button *}
          <div class="form-group w-100 mt-2">
            <button type="submit" class="btn btn-light btn-block {$captcha->getButtonClass($captchaForm)}">
              {lang key='pwresetsubmit'}
            </button>
          </div>

          {* Back to Login Link *}
          <div class="form-group d-flex flex-wrap col-gap-2 justify-content-center">
            <p class="text-size-sm color-muted-foreground">{lang key='hasAccount'}</p>
            <a href="{routePath('login')}" class="theme-link">{lang key='loginbutton'}</a>
          </div>

        </div>
      </form>

      {* Optional: Linked accounts feedback *}
      {include file="$template/includes/linkedaccounts.tpl" linkContext="pwreset" customFeedback=true}

      {* Footer Links *}
      <div class="float-links">
        <div class="d-flex align-items-center justify-content-center flex-wrap">
          <a href="{$WEB_ROOT}" class="theme-link mx-3">{lang key='clientareanavhome'}</a>
          <a href="{$WEB_ROOT}/knowledgebase.php" class="theme-link mx-3">{lang key='knowledgebase'}</a>
          <a href="{$WEB_ROOT}/announcements.php" class="theme-link mx-3">{lang key='announcements'}</a>
          <a href="{$WEB_ROOT}/contact.php" class="theme-link mx-3">{lang key='contact'}</a>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    if (document.querySelector(".alert-success")) {
      setTimeout(function() {
        window.location.href = "{routePath('login')}";
      }, 2000);
    }
  });
</script>