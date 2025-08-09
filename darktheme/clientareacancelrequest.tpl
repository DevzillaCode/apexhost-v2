{if $invalid}

    {include file="$template/includes/alert.tpl" type="error" message="{lang key='clientareacancelinvalid'}"}
    <p class="text-center">
        <a href="clientarea.php?action=productdetails&amp;id={$id}" class="btn btn-primary">{lang key='clientareabacklink'}</a>
    </p>

{elseif $requested}

    {include file="$template/includes/alert.tpl" type="success" message="{lang key='clientareacancelconfirmation'}"}

    <p class="text-center">
        <a href="clientarea.php?action=productdetails&amp;id={$id}" class="btn btn-primary">{lang key='clientareabacklink'}</a>
    </p>

{else}

    {if $error}
        {include file="$template/includes/alert.tpl" type="error" errorshtml="<li>{lang key='clientareacancelreasonrequired'}</li>"}
    {/if}

    {include file="$template/includes/alert.tpl" type="info" message="{lang key='clientareacancelproduct'}: <strong>{$groupname} - {$productname}</strong>{if $domain} ({$domain}){/if}"}

    <div class="card">
        <div class="card-body">

            <form method="post" action="{$smarty.server.PHP_SELF}?action=cancel&amp;id={$id}" class="form-stacked">
                <input type="hidden" name="sub" value="submit" />

                <fieldset>
                    <div class="form-group">
                        <label for="cancellationreason">{lang key='clientareacancelreason'}</label>
                        <textarea name="cancellationreason" id="cancellationreason" class="form-control fullwidth" rows="6"></textarea>
                    </div>

                    {if $domainid}
                        <div class="alert alert-warning">
                            <div>
                                {* alert-icon *}
                                <div class="alert-icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-globe-icon lucide-globe">
                                        <circle cx="12" cy="12" r="10" />
                                        <path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20" />
                                        <path d="M2 12h20" />
                                    </svg>
                                </div>
                                {* alert-content *}
                                <div class="alert-content">
                                    {* alert-title *}
                                    <h2 class="alert-title">{lang key='cancelrequestdomain'}</h2>
                                    {* alert-message *}
                                    <p class="alert-message">{"{lang key='cancelrequestdomaindesc'}"|sprintf2:$domainnextduedate:$domainprice:$domainregperiod}</p>
                                    {* form-check *}
                                    <label class="form-check mt-4">
                                        <input type="checkbox" class="form-check-input" name="canceldomain" id="canceldomain" />
                                        <span class="checkmark"></span>
                                        {lang key='cancelrequestdomainconfirm'}
                                    </label>
                                </div>
                            </div>
                        </div>
                    {/if}

                    <div class="form-group text-center">
                        <label class="form-label" for="type">{lang key='clientareacancellationtype'}</label>
                        <span class="d-inline-block">
                            <select name="type" id="type" class="form-control">
                                <option value="Immediate">{lang key='clientareacancellationimmediate'}</option>
                                <option value="End of Billing Period">{lang key='clientareacancellationendofbillingperiod'}</option>
                            </select>
                        </span>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-danger">
                            {lang key='clientareacancelrequestbutton'}
                        </button>
                        <a href="clientarea.php?action=productdetails&id={$id}" class="btn btn-light">{lang key='cancel'}</a>
                    </div>
                </fieldset>

            </form>

        </div>
    </div>

{/if}