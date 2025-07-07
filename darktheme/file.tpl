<div class="ml-auto">
        <div class="input-group active-client" role="group">
          <div class="input-group-prepend d-none d-md-inline">
            <span class="input-group-text">{lang key='loggedInAs'}:</span>
          </div>
          <div class="btn-group">
            <a href="{$WEB_ROOT}/clientarea.php?action=details" class="btn btn-active-client">
              <span>
                {if $client.companyname}
                  {$client.companyname}
                {else}
                  {$client.fullName}
                {/if}
              </span>
            </a>
            <a href="{routePath('user-accounts')}" class="btn" data-toggle="tooltip" data-placement="bottom" title="Switch Account">
              <i class="fad fa-random"></i>
            </a>
            {if $adminMasqueradingAsClient || $adminLoggedIn}
              <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="btn btn-return-to-admin" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{lang key='adminmasqueradingasclient'} {lang key='logoutandreturntoadminarea'}{else}{lang key='adminloggedin'} {lang key='returntoadminarea'}{/if}">
                <i class="fas fa-redo-alt"></i>
                <span class="d-none d-md-inline-block">{lang key="admin.returnToAdmin"}</span>
              </a>
            {/if}
          </div>
        </div>
      </div>