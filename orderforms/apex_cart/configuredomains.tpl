{* Include common template components *}
{include file="orderforms/apex_cart/common.tpl"}

{* Localisation *}
<script>
  var _localLang = {
    'addToCart': '{$LANG.orderForm.addToCart|escape}',
    'addedToCartRemove': '{$LANG.orderForm.addedToCartRemove|escape}'
  }
</script>

{* Main container *}
<div id="order-apex_cart">
  {* row *}
  <div class="row">
    {* sidebar *}
    <div class="cart-sidebar">
      {include file="orderforms/apex_cart/sidebar-categories.tpl"}
    </div>
    {* main-content *}
    <div class="cart-body">
      {* heading *}
      {include file="$template/components/heading/PageTitle.tpl" headline="{lang key='cartdomainsconfig'}" tagline="{lang key='orderForm.reviewDomainAndAddons'}" }
      {* categories *}
      {include file="orderforms/apex_cart/sidebar-categories-collapsed.tpl"}

      {* configration-form *}
      <form method="post" action="{$smarty.server.PHP_SELF}?a=confdomains" id="frmConfigureDomains">
        {* update *}
        <input type="hidden" name="update" value="true" />
        {* errors *}
        {if $errormessage}
          <div class="alert alert-danger" role="alert">
            <div>
              <p>{$LANG.orderForm.correctErrors}:</p>
              <ul>
                {$errormessage}
              </ul>
            </div>
          </div>
        {/if}
        {* domains *}
        <div class="d-flex flex-column gap-8">
          {* domains *}
          {foreach $domains as $num => $domain}
            {* domain-container *}
            <div class="domain-container position-relative">
              {* container-sub-heading *}
              <div class="container-sub-heading has-line">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-corner-up-right-icon lucide-corner-up-right">
                  <path d="m15 14 5-5-5-5" />
                  <path d="M4 20v-7a4 4 0 0 1 4-4h12" />
                </svg>
                <span class="">{$domain.domain}</span>
              </div>
              {* content *}
              <div class="content">

                {* row *}
                <div class="row row-gap-4">
                  {* col - regperiod *}
                  <div class="col-sm-6">
                    {* regperiod *}
                    <div class="form-group">
                      <label class="form-label">{$LANG.orderregperiod}</label>
                      <div class="text-muted text-size-sm font-weight-semibold">{$domain.regperiod} {$LANG.orderyears}</div>
                    </div>
                  </div>
                  {* col - hosting *}
                  <div class="col-sm-6">
                    {* hosting *}
                    <div class="form-group">
                      <label class="form-label">{$LANG.hosting}</label>
                      <div class="text-muted text-size-sm font-weight-semibold">
                        {if $domain.hosting}<div style="color:#009900;">[{$LANG.cartdomainshashosting}]</div>{else}<a href="{$WEB_ROOT}/cart.php" style="color:#cc0000;">[{$LANG.cartdomainsnohosting}]</a>{/if}
                      </div>
                    </div>
                  </div>
                  {* col - epp *}
                  {if $domain.eppenabled}
                    <div class="col-sm-12 mt-4">
                      {* epp *}
                      <div class="form-group">
                        {* label *}
                        <label for="inputEppcode{$num}" class="form-label">{$LANG.domaineppcode}</label>
                        {* input *}
                        <div class="prepend-icon">
                          <div class="form-float-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-scan-icon lucide-scan">
                              <path d="M3 7V5a2 2 0 0 1 2-2h2" />
                              <path d="M17 3h2a2 2 0 0 1 2 2v2" />
                              <path d="M21 17v2a2 2 0 0 1-2 2h-2" />
                              <path d="M7 21H5a2 2 0 0 1-2-2v-2" />
                            </svg>
                          </div>
                          {* input *}
                          <input type="text" name="epp[{$num}]" id="inputEppcode{$num}" value="{$domain.eppvalue}" class="form-control" placeholder="{$LANG.domaineppcode}" />
                        </div>
                      </div>
                    </div>
                  {/if}
                </div>

                {* addons *}
                {if $domain.dnsmanagement || $domain.emailforwarding || $domain.idprotection}
                  {* row *}
                  <div class="row addon-products row-gap-4 mt-8">
                    {* col - dns *}
                    {if $domain.dnsmanagement}
                      {* col *}
                      <div class="col-sm-{math equation="12 / numAddons" numAddons=$domain.addonsCount}">
                        {* panel *}
                        <div class="panel panel-default panel-addon{if $domain.dnsmanagementselected} panel-addon-selected{/if}">
                          {* panel-body *}
                          <div class="panel-body">
                            {* checkbox *}
                            <label class="form-check mb-4">
                              <input type="checkbox" class="form-check-input" name="dnsmanagement[{$num}]" {if $domain.dnsmanagementselected} checked{/if} />
                              <span class="checkmark"></span>
                              {$LANG.domaindnsmanagement}
                            </label>
                            {* panel-text *}
                            <p class="panel-text">{$LANG.domainaddonsdnsmanagementinfo}</p>
                          </div>
                          {* panel-price *}
                          <div class="panel-price">
                            {$domain.dnsmanagementprice} / {$domain.regperiod} {$LANG.orderyears}
                          </div>
                          {* panel-add *}
                          <div class="panel-add">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus-icon lucide-plus">
                              <path d="M5 12h14" />
                              <path d="M12 5v14" />
                            </svg>
                            {$LANG.orderForm.addToCart}
                          </div>
                        </div>
                      </div>
                    {/if}
                    {* col - id *}
                    {if $domain.idprotection}
                      {* col *}
                      <div class="col-sm-{math equation="12 / numAddons" numAddons=$domain.addonsCount} mb-3">
                        {* panel *}
                        <div class="panel panel-default panel-addon{if $domain.idprotectionselected} panel-addon-selected{/if}">
                          {* panel-body *}
                          <div class="panel-body">
                            {* checkbox *}
                            <label class="form-check mb-4">
                              <input type="checkbox" class="form-check-input" name="idprotection[{$num}]" {if $domain.idprotectionselected} checked{/if} />
                              <span class="checkmark"></span>
                              {$LANG.domainidprotection}
                            </label>
                            {* panel-text *}
                            <p class="panel-text">{$LANG.domainaddonsidprotectioninfo}</p>
                          </div>
                          {* panel-price *}
                          <div class="panel-price">
                            {$domain.idprotectionprice} / {$domain.regperiod} {$LANG.orderyears}
                          </div>
                          {* panel-add *}
                          <div class="panel-add">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus-icon lucide-plus">
                              <path d="M5 12h14" />
                              <path d="M12 5v14" />
                            </svg>
                            {$LANG.orderForm.addToCart}
                          </div>
                        </div>
                      </div>
                    {/if}
                    {* col - email *}
                    {if $domain.emailforwarding}
                      {* col *}
                      <div class="col-sm-{math equation="12 / numAddons" numAddons=$domain.addonsCount} mb-3">
                        {* panel *}
                        <div class="panel panel-default panel-addon{if $domain.emailforwardingselected} panel-addon-selected{/if}">
                          {* panel-body *}
                          <div class="panel-body">
                            {* checkbox *}
                            <label class="form-check mb-4">
                              <input type="checkbox" class="form-check-input" name="emailforwarding[{$num}]" {if $domain.emailforwardingselected} checked{/if} />
                              <span class="checkmark"></span>
                              {$LANG.domainemailforwarding}
                            </label>
                            {* panel-text *}
                            <p class="panel-text">
                              {$LANG.domainaddonsemailforwardinginfo}
                            </p>
                          </div>
                          <div class="panel-price">
                            {$domain.emailforwardingprice} / {$domain.regperiod} {$LANG.orderyears}
                          </div>
                          <div class="panel-add">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus-icon lucide-plus">
                              <path d="M5 12h14" />
                              <path d="M12 5v14" />
                            </svg>
                            {$LANG.orderForm.addToCart}
                          </div>
                        </div>
                      </div>
                    {/if}
                  </div>
                {/if}

                {* fields *}
                {foreach from=$domain.fields key=domainfieldname item=domainfield}
                  <div class="form-group row">
                    <div class="col-sm-4 text-sm-right">{$domainfieldname}:</div>
                    <div class=" col-sm-8">{$domainfield}</div>
                  </div>
                {/foreach}

              </div>
            </div>
          {/foreach}
          {* nameservers *}
          {if $atleastonenohosting}
            {* cd-content *}
            <div class="cd-content">
              {* sub-heading *}
              <div class="sub-heading">
                <span class="primary-bg-color">{$LANG.domainnameservers}</span>
              </div>
              {* description *}
              <p class="mb-6">{$LANG.cartnameserversdesc}</p>
              {* row *}
              <div class="row row-gap-4">
                {* col - nameserver 1 *}
                <div class="col-sm-4">
                  <div class="form-group">
                    <label for="inputNs1" class="form-label">{$LANG.domainnameserver1}</label>
                    <input type="text" class="form-control" id="inputNs1" name="domainns1" value="{$domainns1}" />
                  </div>
                </div>
                {* col - nameserver 2 *}
                <div class="col-sm-4">
                  <div class="form-group">
                    <label for="inputNs2" class="form-label">{$LANG.domainnameserver2}</label>
                    <input type="text" class="form-control" id="inputNs2" name="domainns2" value="{$domainns2}" />
                  </div>
                </div>
                {* col - nameserver 3 *}
                <div class="col-sm-4">
                  <div class="form-group">
                    <label for="inputNs3" class="form-label">{$LANG.domainnameserver3}</label>
                    <input type="text" class="form-control" id="inputNs3" name="domainns3" value="{$domainns3}" />
                  </div>
                </div>
                {* col - nameserver 4 *}
                <div class="col-sm-4">
                  <div class="form-group">
                    <label for="inputNs1" class="form-label">{$LANG.domainnameserver4}</label>
                    <input type="text" class="form-control" id="inputNs4" name="domainns4" value="{$domainns4}" />
                  </div>
                </div>
                {* col - nameserver 5 *}
                <div class="col-sm-4">
                  <div class="form-group">
                    <label for="inputNs5" class="form-label">{$LANG.domainnameserver5}</label>
                    <input type="text" class="form-control" id="inputNs5" name="domainns5" value="{$domainns5}" />
                  </div>
                </div>
              </div>
            </div>
          {/if}

          {* page-footer *}
          <div class="page-footer mt-2">
            {* buttons *}
            <div class="d-flex justify-content-end gap-2">
              <button type="reset" class="btn btn-ghost-light">
                {$LANG.cancel}
              </button>
              <button type="submit" class="btn btn-primary">
                {$LANG.continue}
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right">
                  <path d="M5 12h14" />
                  <path d="m12 5 7 7-7 7" />
                </svg>
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
{* recommendations-modal *}
{include file="orderforms/apex_cart/recommendations-modal.tpl"}