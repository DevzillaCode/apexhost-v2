<link href="{assetPath file='store.css'}" rel="stylesheet">

<div class="landing-page ssl">

    <div class="hero">
        <div class="container">
            <h2>{lang key='store.ssl.competitiveUpgrades.switch'}</h2>
            <h3>{lang key='store.ssl.competitiveUpgrades.replace'}</h3>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current="competitiveupgrade"}

    <div class="content-block">
        <div class="container text-center">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 offset-md-1">
                    <h4>{lang key='store.ssl.competitiveUpgrades.buyWithTime'} <strong>{lang key='store.ssl.competitiveUpgrades.foc'}</strong>.</h4>

                    <div class="alert alert-warning text-left">
                        <div>
                            <!-- alert-icon -->
                            <div class="alert-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star-icon lucide-star">
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                                </svg>
                            </div>
                            <!-- alert-content -->
                            <div class="alert-content">
                                <!-- alert-message -->
                                <p class="alert-message">
                                    <strong>{lang key='store.ssl.competitiveUpgrades.exampleScenario'}</strong><br>
                                    {lang key='store.ssl.competitiveUpgrades.example.line1'}<br>
                                    {lang key='store.ssl.competitiveUpgrades.example.line2'}<br>
                                    {lang key='store.ssl.competitiveUpgrades.example.line3'}
                                </p>
                            </div>
                        </div>
                    </div>

                    <p>{lang key='store.ssl.competitiveUpgrades.eligibilityCheck'}</p>

                    {if $connectionError}
                        <div class="alert alert-danger">
                            <div>
                                <p class="alert-message">{lang key='store.ssl.competitiveUpgrades.checkFailed'}</p>
                            </div>
                        </div>
                    {elseif $error}
                        <div class="alert alert-danger">
                            <div>
                                <p class="alert-message">{$error}</p>
                            </div>
                        </div>
                    {else}
                        <br>
                    {/if}

                    <form method="post" action="{routePath('cart-ssl-certificates-competitiveupgrade-validate')}">

                        {if $validated}
                            {if $eligible}
                                <div class="alert alert-success text-center">
                                    <div>
                                        <p class="alert-message">{lang key='store.ssl.competitiveUpgrades.eligible'}</p>
                                    </div>
                                </div>
                                <table class="table table-striped">
                                    <tr>
                                        <td>{lang key='store.ssl.competitiveUpgrades.expirationDate'}</td>
                                        <td>{$expirationDate}</td>
                                    </tr>
                                    <tr>
                                        <td>{lang key='store.ssl.competitiveUpgrades.monthsRemaining'}</td>
                                        <td>{lang key='store.ssl.competitiveUpgrades.months' months=$monthsRemaining}</td>
                                    </tr>
                                    <tr>
                                        <td>{lang key='store.ssl.competitiveUpgrades.freeExtension'}</td>
                                        <td>{lang key='store.ssl.competitiveUpgrades.months' months=$freeExtensionMonths}{if $freeExtensionMonths < $monthsRemaining} ({lang key='store.ssl.competitiveUpgrades.maxMonths'}){/if}</td>
                                    </tr>
                                    {if isset($maxPotentialSavingAmount)}
                                        <tr>
                                            <td>{lang key='store.ssl.competitiveUpgrades.saving'}</td>
                                            <td>{lang key='store.ssl.competitiveUpgrades.savingDescription' saveAmount=$maxPotentialSavingAmount}</td>
                                        </tr>
                                    {/if}
                                </table>
                                <a class="btn btn-primary btn-lg" href="{routePath('store-product-group', $productGroupSlug, 'ev')}">
                                    {lang key='store.ssl.competitiveUpgrades.continue'}
                                </a>
                            {else}
                                <div class="alert alert-warning text-center">
                                    <div>
                                        <p class="alert-message">{lang key='store.ssl.competitiveUpgrades.ineligible'}*.</p>
                                    </div>
                                </div>
                            {/if}
                        {/if}

                        {if !$validated || !$eligible}
                            <div class="input-group input-group-lg">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">https://</span>
                                </div>
                                <input type="text" name="url" value="{$url}" class="form-control" placeholder="{lang key='store.ssl.competitiveUpgrades.enterDomain'}">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-primary">
                                        {lang key='store.ssl.competitiveUpgrades.validate'}
                                    </button>
                                </div>
                            </div>
                            <p><small>* {lang key='store.ssl.competitiveUpgrades.competitors'}</small></p>
                        {/if}
                    </form>

                </div>
            </div>
        </div>
    </div>

</div>