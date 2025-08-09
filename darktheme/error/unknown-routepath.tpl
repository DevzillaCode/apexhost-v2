{include file="$template/error/page-not-found.tpl"}

<div class="alert alert-info text-center mb-5">
    <div>
        <p class="alert-message">
            Sorry, but the previous page (<a href="{$referrer|escape}" class="alert-link">{$referrer|escape}</a>) provided an invalid page link.
        </p>
    </div>
</div>