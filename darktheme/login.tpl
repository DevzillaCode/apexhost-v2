{assign var="assetPath" value="{$WEB_ROOT}/templates/{$template}/images/"}

{* auth-page *}
<div class="auth-page">
  <div class="container-fluid">
    {* page-content *}
    <div class="page-content d-flex align-items-center justify-content-center flex-column w-100">
      <form method="" action="" class="nt-auth-form">
        {* Logo *}
        <div class="logo-container text-center --mb-4">
          <img src="{$assetPath}logo-square.png" class="img-fluid logo" alt="{$companyname}">
        </div>
        {* form-header *}
        <div class="form-header --mb-10">
          <h1 class="--title-3 --color-foreground --mb-2">Welcome Back</h1>
          <p class="--text-base">Enter your email and password to access your account</p>
        </div>
        {* form-body *}
        <div class="form-body">
          {* Email Address Field *}
          <div class="nt-form-group">
            {* label *}
            <label class="nt-label">Email</label>
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
              <input type="email" class="nt-input" placeholder="Email" aria-label="Email">
            </div>
          </div>
          {* Password Field *}
          <div class="nt-form-group">
            {* label *}
            <label class="nt-label">Password</label>
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
              <input type="password" class="nt-input" placeholder="Password" aria-label="Password">
            </div>
          </div>
          {* Remember Me Checkbox *}
          <div class="nt-for-group d-flex align-items-center justify-content-between">
            {* nt-checkbox *}
            <label for="asd-password" class="nt-checkbox">
              <input type="checkbox" class="" id="asd-password">
              <span class="checkmark"></span>
              Remember Password
            </label>
            <a href="#" class="nt-link">Forgot Password?</a>
          </div>
          {* Login Button *}
          <div class="form-group --mt-6">
            <button type="submit" class="nt-btn nt-btn-default nt-btn-block">Login</button>
          </div>
          <div class="form-group text-center --mt-6 d-flex align-items-center justify-content-center">
          <p class="--text-sm --color-muted-foreground">Don't have an account? &nbsp;</p><a href="#" class="nt-link">Create an Account</a>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>