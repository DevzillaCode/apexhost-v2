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
              {if $sslProduct->status == $sslStatusAwaitingIssuance}
                <button class="btn btn-light btn-sm btn-resend-approver-email" data-url="{routePath('clientarea-ssl-certificates-resend-approver-email')}" data-addonid="{$sslProduct->addonId}">{lang key='sslresendmail'}</button>
              {/if}
              {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                <a href="{$sslProduct->getConfigurationUrl()}" class="btn btn-light btn-sm">{lang key='sslconfigure'}</a>
              {/if}
              {if $sslProduct->addon->nextDueDateProperties['isFuture']}
                <form action="{$sslProduct->getUpgradeUrl()}" method="post">
                  <input type="hidden" name="id" value="{$sslProduct->id}">
                  <button type="submit" class="btn btn-light btn-sm" {if $sslProduct->validationType == 'EV'} disabled="disabled" {/if}>{lang key='upgrade'}</button>
                </form>
              {/if}
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
                <button class="btn btn-light btn-sm btn-resend-approver-email" data-url="{routePath('clientarea-ssl-certificates-resend-approver-email')}" data-serviceid="{$sslProduct->serviceId}">{lang key='sslresendmail'}</button>
              {/if}
              {if $sslProduct->status == $sslStatusAwaitingConfiguration}
                <a href="{$sslProduct->getConfigurationUrl()}" class="btn btn-light btn-sm">{lang key='sslconfigure'}</a>
              {/if}
            </td>
          {/if}
        </tr>
      {/foreach}
    </tbody>
  </table>
</div>