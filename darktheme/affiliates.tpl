{if $inactive}

    {include file="$template/includes/alert.tpl" type="danger" message="{lang key='affiliatesdisabled'}"}

{else}
    {include file="$template/includes/flashmessage.tpl"}
    {if $withdrawrequestsent}
        <div class="alert-container">
            <div class="alert alert-success alert-float">
                <div>
                    {* alert-icon *}
                    <div class="alert-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-icon lucide-circle-check">
                            <circle cx="12" cy="12" r="10" />
                            <path d="m9 12 2 2 4-4" />
                        </svg>
                    </div>
                    {* alert-content *}
                    <div class="alert-content">
                        {* alert-message *}
                        <p class="alert-message">{lang key='affiliateswithdrawalrequestsuccessful'}</p>
                    </div>
                    {* close-alert *}
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

    <div class="row">

        <div class="col-md-4">
            <div class="affiliate-stat affiliate-stat-green alert-warning mb-2">
                <i class="fas fa-users"></i>
                <span>{$visitors}</span>
                {lang key='affiliatesclicks'}
            </div>
        </div>

        <div class="col-md-4">
            <div class="affiliate-stat affiliate-stat-green alert-info mb-2">
                <i class="fas fa-shopping-cart"></i>
                <span>{$signups}</span>
                {lang key='affiliatessignups'}
            </div>
        </div>

        <div class="col-md-4">
            <div class="affiliate-stat affiliate-stat-green alert-success mb-2">
                <i class="far fa-chart-bar"></i>
                <span>{$conversionrate}%</span>
                {lang key='affiliatesconversionrate'}
            </div>
        </div>

    </div>

    <div class="card my-3">
        <div class="card-body">

            <p class="h3">{lang key='affiliatesreferallink'}</p>
            <input type="text" class="form-control" readonly="readonly" value="{$referrallink}">

        </div>
    </div>

    <div class="row">
        <div class="col-md-8 offset-md-2">
            <table class="table table-bordered table-striped table-rounded">
                <tr>
                    <td class="text-right">{lang key='affiliatescommissionspending'}:</td>
                    <td><strong>{$pendingcommissions}</strong></td>
                </tr>
                <tr>
                    <td class="text-right">{lang key='affiliatescommissionsavailable'}:</td>
                    <td><strong>{$balance}</strong></td>
                </tr>
                <tr>
                    <td class="text-right">{lang key='affiliateswithdrawn'}:</td>
                    <td><strong>{$withdrawn}</strong></td>
                </tr>
            </table>
        </div>
    </div>

    {if !$withdrawrequestsent}
        <div class="text-center">
            <form method="POST" action="{$smarty.server.PHP_SELF}">
                <input type="hidden" name="action" value="withdrawrequest" />
                <button type="submit" class="btn btn-lg btn-danger{if !$withdrawlevel} disabled" disabled="disabled{/if}">
                    <i class="fas fa-university"></i> {lang key='affiliatesrequestwithdrawal'}
                </button>
            </form>
        </div>
        {if !$withdrawlevel}
            <p class="text-muted text-center">{lang key="affiliateWithdrawalSummary" amountForWithdrawal=$affiliatePayoutMinimum}</p>
        {/if}
    {/if}

    <h2>{lang key='affiliatesreferals'}</h2>

    {include file="$template/includes/tablelist.tpl" tableName="AffiliatesList"}
    <script>
        jQuery(document).ready(function() {
            var table = jQuery('#tableAffiliatesList').show().DataTable();

            {if $orderby == 'regdate'}
                table.order(0, '{$sort}');
            {elseif $orderby == 'product'}
                table.order(1, '{$sort}');
            {elseif $orderby == 'amount'}
                table.order(2, '{$sort}');
            {elseif $orderby == 'status'}
                table.order(4, '{$sort}');
            {/if}
            table.draw();
            jQuery('#tableLoading').hide();
        });
    </script>
    <div class="table-container clearfix">
        <table id="tableAffiliatesList" class="table table-list w-hidden">
            <thead>
                <tr>
                    <th>{lang key='affiliatessignupdate'}</th>
                    <th>{lang key='orderproduct'}</th>
                    <th>{lang key='affiliatesamount'}</th>
                    <th>{lang key='affiliatescommission'}</th>
                    <th>{lang key='affiliatesstatus'}</th>
                </tr>
            </thead>
            <tbody>
                {foreach $referrals as $referral}
                    <tr class="text-center">
                        <td><span class="w-hidden">{$referral.datets}</span>{$referral.date}</td>
                        <td>{$referral.service}</td>
                        <td data-order="{$referral.amountnum}">{$referral.amountdesc}</td>
                        <td data-order="{$referral.commissionnum}">{$referral.commission}</td>
                        <td><span class='label status status-{$referral.rawstatus|strtolower}'>{$referral.status}</span></td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
        <div class="text-center" id="tableLoading">
            <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
        </div>
    </div>

    {if $affiliatelinkscode}
        <h2>{lang key='affiliateslinktous'}</h2>
        <div class="margin-bottom text-center">
            {$affiliatelinkscode}
        </div>
    {/if}

{/if}