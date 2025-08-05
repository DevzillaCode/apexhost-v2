{assign var="assetPath" value="{$WEB_ROOT}/templates/{$template}/images/"}
<div class="providerLinkingFeedback"></div>

{* auth-page *}
<div class="auth-page">
  {* video-bg-wrapper *}
  <div class="video-bg-wrapper">
    <video autoplay muted loop playsinline class="bg-video">
      <source src="{$WEB_ROOT}/templates/{$template}/videos/bg.mp4" type="video/mp4" />
      Your browser does not support the video tag.
    </video>
    <div class="video-overlay-blur"></div>
  </div>
  {* container-fluid *}
  <div class="container-fluid">
    {* page-content *}
    <div class="page-content d-flex align-items-center justify-content-center flex-column w-100">
      {* login-form *}
      <form method="post" action="{routePath('login-validate')}" class="nt-auth-form" role="form">
        {* Logo *}
        <div class="logo-container text-center mb-6">
          <img src="{$assetPath}logo.png" class="img-fluid logo" alt="{$companyname}">
        </div>
        {* form-header *}
        <div class="form-header mb-10">
          <h1 class="title-3 color-foreground font-weight-semibold mb-2">{lang key="welcomeBack"}</h1>
          <p class="text-size-base">{lang key="enterEmailAndPass"}</p>
        </div>
        {include file="$template/includes/flashmessage.tpl"}
        {* form-body *}
        <div class="form-body d-flex flex-column gap-4">
          {* Email Address Field *}
          <div class="form-group">
            <label for="inputEmail" class="form-label">{lang key='clientareaemail'}</label>
            <input type="email" class="form-control" name="username" id="inputEmail" placeholder="name@example.com" aria-label="name@example.com" autofocus autocomplete="off">
          </div>
          {* Password Field *}
          <div class="form-group">
            <label for="inputPassword" class="form-label">{lang key='clientareapassword'}</label>
            <input type="password" class="form-control" name="password" id="inputPassword" placeholder="{lang key='clientareapassword'}" aria-label="{lang key='clientareapassword'}" autocomplete="off">
          </div>
          {if $captcha->isEnabled()}
            {include file="$template/includes/captcha.tpl"}
          {/if}
          {* Remember Me Checkbox *}
          <div class="form-group d-flex align-items-center justify-content-between">
            <label class="form-check">
              <input type="checkbox" class="form-check-input" id="remember-password" name="rememberme" />
              <span class="checkmark"></span>
              {lang key='loginrememberme'}
            </label>
            <a href="{routePath('password-reset-begin')}" class="theme-link">{lang key='forgotpw'}</a>
          </div>
          {* Form action buttons *}
          <div class="form-group w-100 mt-2">
            <button type="submit" class="btn btn-light btn-block {$captcha->getButtonClass($captchaForm)}">{lang key='loginbutton'}</button>
          </div>
          <div class="form-group d-flex flex-wrap col-gap-2 justify-content-center">
            <p class="text-size-sm color-muted-foreground">{lang key='userLogin.notRegistered'}</p>
            <a href="{$WEB_ROOT}/register.php" class="theme-link">{lang key='userLogin.createAccount'}</a>
          </div>
        </div>
      </form>
      {* linked-accounts *}
      {include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}
      {* float-links *}
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