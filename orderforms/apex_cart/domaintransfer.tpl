{* Include common template components *}
{include file="orderforms/apex_cart/common.tpl"}

<div id="order-apex_cart">
  <div class="row">
    {* Left sidebar with categories *}
    <div class="cart-sidebar">
      {include file="orderforms/apex_cart/sidebar-categories.tpl"}
    </div>

    {* Main content area *}
    <div class="cart-body">
      <!-- Page header with title and tagline -->
      {include file="$template/components/heading/PageTitle.tpl" headline="{lang key='orderForm.transferToUs'}" tagline="{lang key='orderForm.transferExtend'}" }

      {* Mobile collapsed sidebar *}
      {include file="orderforms/apex_cart/sidebar-categories-collapsed.tpl"}

      {* Domain transfer form *}
      <form method="post" action="{$WEB_ROOT}/cart.php" id="frmDomainTransfer">
        <input type="hidden" name="a" value="addDomainTransfer">
        {* Transfer unavailable alert - initially hidden *}
        <div id="transferUnavailable" class="alert alert-warning slim-alert text-center w-hidden"></div>

        <div class="row row-gap-4">
          {* Domain name input field *}
          <div class="col-lg-6">
            <div class="form-group">
              <label class="form-label" for="inputTransferDomain">{lang key='domainname'}</label>
              <input type="text" class="form-control" name="domain" id="inputTransferDomain" value="{$lookupTerm}" placeholder="{lang key='yourdomainplaceholder'}.{lang key='yourtldplaceholder'}" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" autocomplete="off" />
            </div>
          </div>
          {* Authorization code input field *}
          <div class="col-lg-6">
            <div class="form-group">
              <label class="form-label" for="inputAuthCode" style="width:100%;">
                {lang key='orderForm.authCode'}
                {* Help tooltip icon *}
                <a data-toggle="tooltip" data-placement="left" title="{lang key='orderForm.authCodeTooltip'}" class="pull-right float-right"><i class="fas fa-question-circle"></i> {lang key='orderForm.help'}</a>
              </label>
              <input type="text" class="form-control" name="epp" id="inputAuthCode" placeholder="{lang key='orderForm.authCodePlaceholder'}" data-toggle="tooltip" data-placement="left" data-trigger="manual" title="{lang key='orderForm.required'}" autocomplete="off" />
            </div>
          </div>
          {* Captcha *}
          {* CAPTCHA section - conditional based on type *}
          {if $captcha->isEnabled() && !$captcha->recaptcha->isEnabled()}
            <div class="col-12">
              {* Basic image CAPTCHA *}
              <div class="captcha-container" id="captchaContainer">
                <div class="default-captcha">
                  <p>{lang key="cartSimpleCaptcha"}</p>
                  <div>
                    <img id="inputCaptchaImage" src="{$systemurl}includes/verifyimage.php" />
                    <input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control input-sm" data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}" />
                  </div>
                </div>
              </div>
            {elseif $captcha->isEnabled() && $captcha->recaptcha->isEnabled() && !$captcha->recaptcha->isInvisible()}
              {* reCAPTCHA (visible version) *}
              <div class="text-center">
                <div class="form-group recaptcha-container" id="captchaContainer"></div>
              </div>
            </div>
          {/if}
          <div class="col-12">
            <button type="submit" id="btnTransferDomain" class="btn btn-primary btn-transfer{$captcha->getButtonClass($captchaForm)}">
              {* Loading spinner - initially hidden *}
              <span class="loader w-hidden" id="addTransferLoader">
                <i class="fas fa-fw fa-spinner fa-spin"></i>
              </span>
              {* Button text *}
              <span id="addToCart">{lang key="orderForm.addToCart"}</span>
            </button>
          </div>
        </div>
      </form>

      {* Disclaimer text *}
      <p class="small mt-4">* {lang key='orderForm.extendExclusions'}</p>
    </div>
  </div>
</div>