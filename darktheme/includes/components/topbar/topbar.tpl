<div class="theme-topbar" id="theme-topbar">
  <div class="container-fluid">
    <div class="topbar-content">
      <div class="d-flex align-items-center">
        <div class="mr-auto">
          <div class="d-flex align-items-center" data-gap-x="6px">
            {* notifications-btn *}
            <button type="button" class="nt-square-btn nt-btn-ghost nt-btn-size-sm {if count($clientAlerts) > 0} nt-has-red-dot{/if}" title="{lang key='notifications'}" data-toggle="popover" id="accountNotifications" data-placement="top">
              <svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 16 16">
                <path fill="currentColor" d="M8 0C6.53 0 5.3.52 4.32 1.56c-2 2.12-2.3 5.86-2.33 7.59C.55 9.6 0 11 0 12c0 .55.45 1 1 1h14c.55 0 1-.45 1-1c0-1-.55-2.4-1.99-2.85c-.03-1.73-.33-5.47-2.33-7.59C10.7.52 9.47 0 8 0m0 16c1.1 0 2-.9 2-2H6c0 1.1.9 2 2 2" />
              </svg>
            </button>
            {* divider *}
            <div class="v-divider"></div>
            <!-- lang-btn -->
            <button type="button" class="nt-square-btn nt-btn-ghost nt-btn-size-sm" title="Translate" data-toggle="modal" data-target="#modalChooseLanguage">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="1 1 22 22">
                <path fill="currentColor" d="m19.713 8.128l-.246.566a.506.506 0 0 1-.934 0l-.246-.566a4.36 4.36 0 0 0-2.22-2.25l-.759-.339a.53.53 0 0 1 0-.963l.717-.319a4.37 4.37 0 0 0 2.251-2.326l.253-.611a.506.506 0 0 1 .942 0l.253.61a4.37 4.37 0 0 0 2.25 2.327l.718.32a.53.53 0 0 1 0 .962l-.76.338a4.36 4.36 0 0 0-2.219 2.251M5 17v-2H3v2a4 4 0 0 0 4 4h3v-2H7l-.15-.006A2 2 0 0 1 5 17m17.4 4L18 10h-2l-4.399 11h2.154l1.199-3h4.09l1.201 3zm-6.647-5L17 12.885L18.245 16zM8 4V2H6v2H2v7h4v3h2v-3h4V4zM4 6h2v3H4zm4 0h2v3H8z" />
              </svg>
              {* account notifications *}
              <div id="accountNotificationsContent" class="w-hidden">
                <ul class="client-alerts">
                  {foreach $clientAlerts as $alert}
                    <li>
                      <a href="{$alert->getLink()}" class="notification-item d-flex align-items-start --p-3">
                        <span class="icon text-{if $alert->getSeverity() == 'danger'}danger{elseif $alert->getSeverity() == 'warning'}warning{elseif $alert->getSeverity() == 'info'}info{else}success{/if}">
                          <i class="fas fa-fw fa-{if $alert->getSeverity() == 'danger'}exclamation-circle{elseif $alert->getSeverity() == 'warning'}exclamation-triangle{elseif $alert->getSeverity() == 'info'}info-circle{else}check-circle{/if}"></i>
                        </span>
                        <span class="message">{$alert->getMessage()}</span>
                      </a>
                    </li>
                  {foreachelse}
                    <li class="none --text-sm --font-normal">
                      {lang key='notificationsnone'}
                    </li>
                  {/foreach}
                </ul>
              </div>
          </div>
        </div>
        {* active-user *}
        <div class="ml-auto">
          {* active-user *}
          <div class="active-user d-flex align-items-center" data-gap-x="6px">
            {* text *}
            <div class="text">{lang key='hello'}:</div>
            {* btn-group *}
            <div class="d-flex align-items-center" data-gap-x="6px">
              <a href="{$WEB_ROOT}/clientarea.php?action=details" class="nt-btn nt-btn-ghost nt-btn-size-sm">
                <span>
                  {if $client.companyname}
                    {$client.companyname}
                  {else}
                    {$client.fullName}
                  {/if}
                </span>
              </a>
              {* divider *}
              <div class="v-divider"></div>
              {* switch-account *}
              <a href="{routePath('user-accounts')}" class="nt-square-btn nt-btn-ghost nt-btn-size-sm" data-toggle="tooltip" data-placement="bottom" title="Switch Account">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                  <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                    <path d="M3 17h2.397a5 5 0 0 0 4.096-2.133l.177-.253m3.66-5.227l.177-.254A5 5 0 0 1 17.603 7H21" />
                    <path d="m18 4l3 3l-3 3M3 7h2.397a5 5 0 0 1 4.096 2.133l4.014 5.734A5 5 0 0 0 17.603 17H21" />
                    <path d="m18 20l3-3l-3-3" />
                  </g>
                </svg>
              </a>
              {if $adminMasqueradingAsClient || $adminLoggedIn}
                <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="d-md-none nt-square-btn nt-btn-ghost nt-btn-size-sm" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{lang key='adminmasqueradingasclient'} {lang key='logoutandreturntoadminarea'}{else}{lang key='adminloggedin'} {lang key='returntoadminarea'}{/if}">
                  <svg width="64px" height="64px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                    <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                    <g id="SVGRepo_iconCarrier">
                      <path d="M15.024 22C16.2771 22 17.3524 21.9342 18.2508 21.7345C19.1607 21.5323 19.9494 21.1798 20.5646 20.5646C21.1798 19.9494 21.5323 19.1607 21.7345 18.2508C21.9342 17.3524 22 16.2771 22 15.024V12C22 10.8954 21.1046 10 20 10H12C10.8954 10 10 10.8954 10 12V20C10 21.1046 10.8954 22 12 22H15.024Z"></path>
                      <path d="M2 15.024C2 16.2771 2.06584 17.3524 2.26552 18.2508C2.46772 19.1607 2.82021 19.9494 3.43543 20.5646C4.05065 21.1798 4.83933 21.5323 5.74915 21.7345C5.83628 21.7538 5.92385 21.772 6.01178 21.789C7.09629 21.9985 8 21.0806 8 19.976L8 12C8 10.8954 7.10457 10 6 10H4C2.89543 10 2 10.8954 2 12V15.024Z"></path>
                      <path d="M8.97597 2C7.72284 2 6.64759 2.06584 5.74912 2.26552C4.8393 2.46772 4.05062 2.82021 3.4354 3.43543C2.82018 4.05065 2.46769 4.83933 2.26549 5.74915C2.24889 5.82386 2.23327 5.89881 2.2186 5.97398C2.00422 7.07267 2.9389 8 4.0583 8H19.976C21.0806 8 21.9985 7.09629 21.789 6.01178C21.772 5.92385 21.7538 5.83628 21.7345 5.74915C21.5322 4.83933 21.1798 4.05065 20.5645 3.43543C19.9493 2.82021 19.1606 2.46772 18.2508 2.26552C17.3523 2.06584 16.2771 2 15.024 2H8.97597Z"></path>
                    </g>
                  </svg>
                </a>
                <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="d-md-block d-none btn-return-to-admin" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{lang key='adminmasqueradingasclient'} {lang key='logoutandreturntoadminarea'}{else}{lang key='adminloggedin'} {lang key='returntoadminarea'}{/if}">
                  <i class="fas fa-redo-alt"></i>
                  <span class="d-none d-md-inline-block">{lang key="admin.returnToAdmin"}</span>
                </a>
              {/if}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>