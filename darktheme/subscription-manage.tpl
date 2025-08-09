<div class="card mw-540">
    <div class="card-body">

        {if $errorMessage}

            {include file="$template/includes/alert.tpl" type="danger" msg=$errorMessage}

        {elseif $infoMessage}

            {include file="$template/includes/alert.tpl" type="info" msg=$infoMessage}

        {elseif $action == 'optin'}

            {include file="$template/includes/alert.tpl" type="success" message="{lang key='thankYou'}"}
            <p class="text-center">{lang key='newslettersubscribed'}</p>

        {elseif $action == 'optout'}

            {include file="$template/includes/alert.tpl" type="success" message="{lang key='thankYou'}"}
            <p>{lang key='newsletterremoved'}</p>
            <p>{"{lang key='newsletterresubscribe'}"|sprintf2:'<a href="clientarea.php?action=details">':'</a>'}</p>

        {/if}

        <br>

        <p class="text-center">
            <a href="{$WEB_ROOT}/index.php" class="btn btn-light">
                <i class="fas fa-home"></i>
                {lang key='returnhome'}
            </a>
        </p>

    </div>
</div>

<br /><br />
