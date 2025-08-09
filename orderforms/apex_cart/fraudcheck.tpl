{include file="orderforms/apex_cart/common.tpl"}

<div id="order-apex_cart">

    <div class="header-lined">
        <h1 class="font-size-36">
            {$LANG.cartfraudcheck}
        </h1>
    </div>

    <div class="row">

        <div class="col-md-10 col-md-offset-1 offset-md-1">

            {include file="orderforms/apex_cart/sidebar-categories-collapsed.tpl"}

            <div class="alert alert-danger error-heading">
                <div>
                    <div class="alert-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-alert-icon lucide-circle-alert">
                            <circle cx="12" cy="12" r="10" />
                            <line x1="12" x2="12" y1="8" y2="12" />
                            <line x1="12" x2="12.01" y1="16" y2="16" />
                        </svg>
                    </div>
                    <div class="alert-content">
                        <p class="alert-message">{$errortitle}</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 offset-sm-2 text-center">
                    {if $userValidation && !$userValidation.submittedAt && $userValidation.token eq true}
                        <p class="margin-bottom">{lang key='fraud.furtherVal'}</p>
                        <p>
                            <a href="#" class="btn btn-light" data-url="{$userValidationUrl}" onclick="openValidationSubmitModal(this);return false;">
                                {lang key='fraud.submitDocs'}
                                &nbsp;<i class="fas fa-arrow-right"></i>
                            </a>
                        </p>
                        <div id="validationSubmitModal" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-body top-margin-10">
                                        <iframe id="validationContent" allow="camera {$userValidationHost}" width="100%" height="700" frameborder="0" src=""></iframe>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-light" data-dismiss="modal">{lang key='close'}</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {else}
                        <p class="margin-bottom">{$error}</p>

                        <p>
                            <a href="{$WEB_ROOT}/submitticket.php" class="btn btn-light">
                                {$LANG.orderForm.submitTicket}
                                &nbsp;<i class="fas fa-arrow-right"></i>
                            </a>
                        </p>
                    {/if}

                </div>
            </div>

        </div>
    </div>
</div>