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
        <div class="logo-container text-center mb-4">
          <img src="{$assetPath}logo-square.png" class="img-fluid logo" alt="{$companyname}">
        </div>
        {* form-header *}
        <div class="form-header mb-10">
          <h1 class="title-3 color-foreground font-weight-semibold mb-2">Welcome Back</h1>
          <p class="text-size-base">Enter your email and password to access your account</p>
        </div>
        {include file="$template/includes/flashmessage.tpl"}
        {* form-body *}
        <div class="form-body">
          {* Email Address Field *}
          <div class="nt-form-group">
            {* label *}
            <label class="nt-label" for="inputEmail">{lang key='clientareaemail'}</label>
            {* input-wrapper *}
            <div class="nt-input-wrapper">
              {* icon *}
              <div class="nt-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-mail-icon lucide-mail">
                  <path d="m22 7-8.991 5.727a2 2 0 0 1-2.009 0L2 7" />
                  <rect x="2" y="4" width="20" height="16" rx="2" />
                </svg>
              </div>
              {* input *}
              <input type="email" class="nt-input" name="username" id="inputEmail" placeholder="name@example.com" aria-label="name@example.com" autofocus autocomplete="off">
            </div>
          </div>
          {* Password Field *}
          <div class="nt-form-group">
            {* label *}
            <label class="nt-label" for="inputPassword">{lang key='clientareapassword'}</label>
            {* input-wrapper *}
            <div class="nt-input-wrapper">
              {* icon *}
              <div class="nt-float-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-lock-icon lucide-lock">
                  <rect width="18" height="11" x="3" y="11" rx="2" ry="2" />
                  <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                </svg>
              </div>
              {* input *}
              <input type="password" class="nt-input" name="password" id="inputPassword" placeholder="{lang key='clientareapassword'}" aria-label="{lang key='clientareapassword'}" autocomplete="off">
            </div>
          </div>
          {if $captcha->isEnabled()}
            {include file="$template/includes/captcha.tpl"}
          {/if}
          {* Remember Me Checkbox *}
          <div class="nt-for-group d-flex align-items-center justify-content-between">
            {* nt-checkbox *}
            <label for="remember-password" class="nt-checkbox">
              <input type="checkbox" id="remember-password" name="rememberme" class="">
              <span class="checkmark"></span>
              {lang key='loginrememberme'}
            </label>
            <a href="{routePath('password-reset-begin')}" class="theme-link">{lang key='forgotpw'}</a>
          </div>
          {* Login Button *}
          <div class="form-group mt-6">
            <button type="submit" class="btn btn-light btn-block {$captcha->getButtonClass($captchaForm)}">{lang key='loginbutton'}</button>
          </div>
          <div class="form-group text-center mt-6 d-flex align-items-center justify-content-center">
            <p class="text-size-sm color-muted-foreground">{lang key='userLogin.notRegistered'} &nbsp;</p><a href="{$WEB_ROOT}/register.php" class="theme-link">{lang key='userLogin.createAccount'}</a>
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