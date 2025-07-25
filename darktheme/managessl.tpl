{* Include tablelist component for SSL certificates table functionality *}
{include file="$template/includes/tablelist.tpl" tableName="SslList" startOrderCol="3" filterColumn="0" noSortColumns="4"}

{* Placeholder for table-related alerts *}
<div class="alert alert-table-ssl-manage w-hidden"></div>

{* Container for SSL certificates table *}
<div class="table-container clearfix">
  <table id="tableSslList" class="table">
    {* Table header *}
    <thead class="thead">
      <tr class="table-row">
        <th class="order-head"></th>
        <th class="table-head">{lang key='ssldomain'}</th>
        <th class="table-head">{lang key='sslproduct'}</th>
        <th class="table-head">{lang key='sslorderdate'}</th>
        <th class="table-head">{lang key='sslrenewaldate'}</th>
        <th class="table-head">{lang key='actions'}</th>
      </tr>
    </thead>
    {* Table body with SSL product entries *}
    <tbody class="tbody">
      {foreach $sslProducts as $sslProduct}
        <tr class="table-row">
          {* Order indicator cell *}
          <td class="order-cell">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="var(--foreground)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-corner-down-right-icon lucide-corner-down-right">
              <path d="m15 10 5 5-5 5" />
              <path d="M4 4v7a4 4 0 0 0 4 4h12" />
            </svg>
          </td>
          {if $sslProduct->addonId && $sslProduct->addonId > 0}
            {* Addon-based SSL product details *}
            <td class="table-cell">
              {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                <label class="label label-info">{lang key='sslawaitingconfig'}</label>
              {else}
                {if $sslProduct->addon->service->domain}{$sslProduct->addon->service->domain}{else}-{/if}
                {if $sslProduct->addon->nextDueDateProperties['isPast']}
                  <label class="label label-default">{lang key='clientareaexpired'}</label>
                {elseif $sslProduct->addon->nextDueDateProperties['daysTillExpiry'] < 60}
                  <label class="label label-danger">{lang key='expiringsoon'}</label>
                {else}
                  {if $sslProduct->wasInstantIssuanceAttempted() && $sslProduct->wasInstantIssuanceSuccessful()} <i class="fas fa-bolt" title="{lang key='sslinstantissuancebenefit'}">{/if}
                  {/if}
                {/if}
            </td>
            {* Addon product name and validation type *}
            <td class="table-cell">
              {$sslProduct->addon->productAddon->name}
              <label class="label label-{if $sslProduct->validationType == 'DV'}default{elseif $sslProduct->validationType == 'OV'}warning{elseif $sslProduct->validationType == 'EV'}success{/if}">
                {$sslProduct->validationType}
              </label>
            </td>
            {* Addon registration date *}
            <td class="table-cell"><span class="w-hidden">{$sslProduct->addon->registrationDate}</span>{$sslProduct->addon->registrationDateFormatted}</td>
            {* Addon renewal date *}
            <td class="table-cell"><span class="w-hidden">{$sslProduct->addon->nextDueDate}</span>{$sslProduct->addon->nextDueDateFormatted}</td>
            {* Actions for addon-based SSL *}
            <td class="table-cell">
              <div class="d-flex flex-wrap gap-2">
                {if $sslProduct->status == $sslStatusAwaitingIssuance}
                  <button class="btn btn-ghsot-info btn-xs btn-resend-approver-email" data-url="{routePath('clientarea-ssl-certificates-resend-approver-email')}" data-addonid="{$sslProduct->addonId}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-refresh-cw-icon lucide-refresh-cw">
                      <path d="M3 12a9 9 0 0 1 9-9 9.75 9.75 0 0 1 6.74 2.74L21 8" />
                      <path d="M21 3v5h-5" />
                      <path d="M21 12a9 9 0 0 1-9 9 9.75 9.75 0 0 1-6.74-2.74L3 16" />
                      <path d="M8 16H3v5" />
                    </svg>
                    {lang key='sslresendmail'}
                  </button>
                {/if}
                {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                  <a href="{$sslProduct->getConfigurationUrl()}" class="btn btn-ghost-info btn-xs">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-cog-icon lucide-cog">
                      <path d="M12 20a8 8 0 1 0 0-16 8 8 0 0 0 0 16Z" />
                      <path d="M12 14a2 2 0 1 0 0-4 2 2 0 0 0 0 4Z" />
                      <path d="M12 2v2" />
                      <path d="M12 22v-2" />
                      <path d="m17 20.66-1-1.73" />
                      <path d="M11 10.27 7 3.34" />
                      <path d="m20.66 17-1.73-1" />
                      <path d="m3.34 7 1.73 1" />
                      <path d="M14 12h8" />
                      <path d="M2 12h2" />
                      <path d="m20.66 7-1.73 1" />
                      <path d="m3.34 17 1.73-1" />
                      <path d="m17 3.34-1 1.73" />
                      <path d="m11 13.73-4 6.93" />
                    </svg>
                    {lang key='sslconfigure'}
                  </a>
                {/if}
                {if $sslProduct->addon->nextDueDateProperties['isFuture']}
                  <form action="{$sslProduct->getUpgradeUrl()}" method="post">
                    <input type="hidden" name="id" value="{$sslProduct->id}">
                    <button type="submit" class="btn btn-ghost-info btn-xs" {if $sslProduct->validationType == 'EV'} disabled="disabled" {/if}>
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-fading-arrow-up-icon lucide-circle-fading-arrow-up">
                        <path d="M12 2a10 10 0 0 1 7.38 16.75" />
                        <path d="m16 12-4-4-4 4" />
                        <path d="M12 16V8" />
                        <path d="M2.5 8.875a10 10 0 0 0-.5 3" />
                        <path d="M2.83 16a10 10 0 0 0 2.43 3.4" />
                        <path d="M4.636 5.235a10 10 0 0 1 .891-.857" />
                        <path d="M8.644 21.42a10 10 0 0 0 7.631-.38" />
                      </svg>
                      {lang key='upgrade'}
                    </button>
                  </form>
                {/if}
              </div>
            </td>
          {else}
            {* Service-based SSL product details *}
            <td class="table-cell">
              {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                <label class="label label-info">{lang key='sslawaitingconfig'}</label>
              {else}
                {if $sslProduct->service->domain}{$sslProduct->service->domain}{else}-{/if}
                {if $sslProduct->service->nextDueDateProperties['isPast']}
                  <label class="label label-default">{lang key='clientareaexpired'}</label>
                {elseif $sslProduct->service->nextDueDateProperties['daysTillExpiry'] < 60}
                  <label class="label label-danger">{lang key='expiringsoon'}</label>
                {/if}
              {/if}
            </td>
            {* Service product name and validation type *}
            <td class="table-cell">
              {$sslProduct->service->product->name}
              <label class="label label-{if $sslProduct->validationType == 'DV'}default{elseif $sslProduct->validationType == 'OV'}warning{elseif $sslProduct->validationType == 'EV'}success{/if}">
                {$sslProduct->validationType}
              </label>
            </td>
            {* Service registration date *}
            <td class="table-cell"><span class="w-hidden">{$sslProduct->service->registrationDate}</span>{$sslProduct->service->registrationDateFormatted}</td>
            {* Service renewal date *}
            <td class="table-cell"><span class="w-hidden">{$sslProduct->service->nextDueDate}</span>{$sslProduct->service->nextDueDateFormatted}</td>
            {* Actions for service-based SSL *}
            <td class="table-cell">
              {if $sslProduct->status == $sslStatusAwaitingIssuance}
                <button class="btn btn-ghost-info btn-xs btn-resend-approver-email" data-url="{routePath('clientarea-ssl-certificates-resend-approver-email')}" data-serviceid="{$sslProduct->serviceId}">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-refresh-cw-icon lucide-refresh-cw">
                    <path d="M3 12a9 9 0 0 1 9-9 9.75 9.75 0 0 1 6.74 2.74L21 8" />
                    <path d="M21 3v5h-5" />
                    <path d="M21 12a9 9 0 0 1-9 9 9.75 9.75 0 0 1-6.74-2.74L3 16" />
                    <path d="M8 16H3v5" />
                  </svg>
                  {lang key='sslresendmail'}
                </button>
              {/if}
              {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                <a href="{$sslProduct->getConfigurationUrl()}" class="btn btn-ghost-info btn-xs">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-cog-icon lucide-cog">
                    <path d="M12 20a8 8 0 1 0 0-16 8 8 0 0 0 0 16Z" />
                    <path d="M12 14a2 2 0 1 0 0-4 2 2 0 0 0 0 4Z" />
                    <path d="M12 2v2" />
                    <path d="M12 22v-2" />
                    <path d="m17 20.66-1-1.73" />
                    <path d="M11 10.27 7 3.34" />
                    <path d="m20.66 17-1.73-1" />
                    <path d="m3.34 7 1.73 1" />
                    <path d="M14 12h8" />
                    <path d="M2 12h2" />
                    <path d="m20.66 7-1.73 1" />
                    <path d="m3.34 17 1.73-1" />
                    <path d="m17 3.34-1 1.73" />
                    <path d="m11 13.73-4 6.93" />
                  </svg>
                  {lang key='sslconfigure'}
                </a>
              {/if}
            </td>
          {/if}
        </tr>
      {/foreach}
    </tbody>
  </table>
</div>