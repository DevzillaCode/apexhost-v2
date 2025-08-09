{if $showRemoteInput}
  <div id="frmRemoteCardProcess" class="text-center">
    {$remoteInput}
    <iframe name="ccframe" class="auth3d-area" width="90%" height="600" scrolling="auto" src="about:blank"></iframe>
  </div>

  <script>
    jQuery("#frmRemoteCardProcess").find("form:first").attr('target', 'ccframe');
    setTimeout("autoSubmitFormByContainer('frmRemoteCardProcess')", 1000);
  </script>
{else}
  {include file="$template/payment/$cardOrBank/validate.tpl"}
  <form id="frmPayment" method="post" action="{$submitLocation}" role="form">
    <input type="hidden" name="invoiceid" value="{$invoiceid}" />

    <div class="row">
      <div class="col-md-7">

        {if $errormessage}
          {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
        {/if}

        <div class="alert alert-danger text-center gateway-errors w-hidden"></div>

        <div class="card">
          <div class="card-body">
            <h3 class="card-title">{lang key="makepayment"}</h3>

            <div id="paymentGatewayInput">
              <div class="cc-payment-form">
                <div class="form-group row">
                  <label class="col-sm-4 text-md-right control-label">
                    {lang key='paymentmethod'}
                  </label>
                  <div class="col-sm-8">
                    {include file="$template/payment/$cardOrBank/select.tpl"}
                  </div>
                </div>

                {if !$hasRemoteInput}
                  {include file="$template/payment/$cardOrBank/inputs.tpl"}
                {/if}
              </div>
            </div>

            <div id="btnSubmitContainer" class="form-group submit-container">
              <div class="text-center">
                <button type="submit" class="btn btn-primary" id="btnSubmit" value="{lang key='submitpayment'}">
                  <span class="pay-text">{lang key='submitpayment'}</span>
                  <span class="click-text w-hidden">{lang key='pleasewait'}</span>
                </button>
              </div>
            </div>
          </div>
        </div>

      </div>
      <div class="col-md-5">
        {include file="$template/payment/invoice-summary.tpl"}
      </div>
    </div>

    {if $servedOverSsl}
      <div class="alert-container">
        <div class="alert alert-warning alert-float" role="alert">
          <div>
            <!-- alert-icon -->
            <div class="alert-icon">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-lock-icon lucide-lock">
                <rect width="18" height="11" x="3" y="11" rx="2" ry="2" />
                <path d="M7 11V7a5 5 0 0 1 10 0v4" />
              </svg>
            </div>
            <!-- alert-content -->
            <div class="alert-content">
              <!-- alert-message -->
              <p class="alert-message">{lang key='creditcardsecuritynotice'}</p>
            </div>
            <!-- close-alert -->
            <div class="alert-dismissible">
              <button type="button" class="alert-close-btn" data-dismiss="alert" aria-label="Close">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x-icon lucide-circle-x">
                  <circle cx="12" cy="12" r="10" />
                  <path d="m15 9-6 6" />
                  <path d="m9 9 6 6" />
                </svg>
              </button>
            </div>
          </div>
        </div>
      </div>
    {/if}

  </form>

  <script>
    jQuery(document).ready(function() {
          jQuery('#inputCardCvv, #inputCardNumber').filter(':visible').first().focus();
          WHMCS.payment.event.gatewayInit({
            _source: 'invoice-pay',
            }, '{$gateway|addslashes}');
            jQuery('#frmPayment').on('submit.paymentjs', function(e) {
              WHMCS.payment.event.checkoutFormSubmit({
                  _source: 'invoice-pay',
                  event: e,
                },
                '{$gateway|addslashes}',
                jQuery(this)
              );
            });
          });
  </script>
{/if}