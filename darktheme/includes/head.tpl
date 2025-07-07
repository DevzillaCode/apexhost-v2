<!-- Styling -->
{\WHMCS\View\Asset::fontCssInclude('open-sans-family.css')}
<link href="{assetPath file='all.css'}?v={$versionHash}" rel="stylesheet">
<link href="{assetPath file='theme.css'}?v={$versionHash}" rel="stylesheet">
<link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet">
{assetExists file="custom.css"}
<link href="{$__assetPath__}" rel="stylesheet">
{/assetExists}
{assetExists file="variables.css"}
<link href="{$__assetPath__}" rel="stylesheet">
{/assetExists}
{assetExists file="buttons.css"}
<link href="{$__assetPath__}" rel="stylesheet">
{/assetExists}
{assetExists file="inputs.css"}
<link href="{$__assetPath__}" rel="stylesheet">
{/assetExists}
{assetExists file="style.css"}
<link href="{$__assetPath__}" rel="stylesheet">
{/assetExists}

<script>
  var csrfToken = '{$token}',
  markdownGuide = '{lang|addslashes key="markdown.title"}',
  locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
  saved = '{lang|addslashes key="markdown.saved"}',
  saving = '{lang|addslashes key="markdown.saving"}',
  whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}";
  {if $captcha}{$captcha->getPageJs()}{/if}
</script>
<script src="{assetPath file='scripts.js'}?v={$versionHash}"></script>

{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}