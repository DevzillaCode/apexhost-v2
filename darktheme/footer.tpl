                    </div>

                    </div>
                    {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                      <div class="d-lg-none sidebar sidebar-secondary">
                        {include file="$template/components/sections/shared/Sidebar.tpl" sidebar=$secondarySidebar}
                      </div>
                    {/if}
                    <div class="clearfix"></div>
                    </div>
                    </div>
                    </section>

                    {if $templatefile !== 'login' && $templatefile !== 'passwordreset' && $templatefile !== 'contact'}
                      <!-- Theme Footer -->
                      {include file="$template/components/sections/shared/Footer.tpl"}
                    {/if}

                    <div id="fullpage-overlay" class="w-hidden">
                      <div class="outer-wrapper">
                        <div class="inner-wrapper">
                          <img src="{$WEB_ROOT}/assets/img/overlay-spinner.svg" alt="">
                          <br>
                          <span class="msg"></span>
                        </div>
                      </div>
                    </div>

                    <div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title"></h5>
                            <button type="button" class="close" data-dismiss="modal">
                              <span aria-hidden="true">&times;</span>
                              <span class="sr-only">{lang key='close'}</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            {lang key='loading'}
                          </div>
                          <div class="modal-footer">
                            <div class="float-left loader">
                              <i class="fas fa-circle-notch fa-spin"></i>
                              {lang key='loading'}
                            </div>
                            <button type="button" class="btn btn-light" data-dismiss="modal">
                              {lang key='close'}
                            </button>
                            <button type="button" class="btn btn-primary modal-submit">
                              {lang key='submit'}
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>

                    <form method="get" action="{$currentpagelinkback}">
                      {** localisation-modal : start **}
                      <div class="modal modal-localisation theme-localisation-modal" id="modalChooseLanguage" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            {* modal-body *}
                            <div class="modal-body">
                              {* custom-modal-header *}
                              <div class="custom-modal-header d-flex align-items-center justify-content-between">
                                <h5 class="modal-title">{lang key='chooselanguage'}</h5>
                                <button type="button" class="btn-square btn-ghost-danger btn-sm" data-dismiss="modal" aria-label="Close">
                                  <span class="icon">
                                    {include file="$template/images/svg/times.svg"}
                                  </span>
                                </button>
                              </div>
                              {* languages-list *}
                              <div class="languages-list">
                                {if $languagechangeenabled && count($locales) > 1}
                                  <div class="row item-selector small-gutters" data-gap-y="15px">
                                    <input type="hidden" name="language" data-current="{$language}" value="{$language}" />
                                    {foreach $locales as $locale}
                                      <div class="col-lg-3 col-md-4 col-sm-6">
                                        <a href="#" class="item{if $language == $locale.language} active{/if}" data-value="{$locale.language}" data-gap-x="10px">
                                          {* <img src="{$WEB_ROOT}/templates/apexhost/images/flags/{$locale.language}.svg" class="flag img-fluid" alt="{$locale.localisedName}" loading="lazy" /> *}
                                          {$locale.localisedName}
                                          {if $language == $locale.language}
                                            <i class="fas fa-check check-icon ml-auto"></i>
                                          {/if}
                                        </a>
                                      </div>
                                    {/foreach}
                                  </div>
                                {/if}
                                {* currency-chooser *}
                                {if !$loggedin && $currencies}
                                  <p class="modal-subtitle pt-5 pb-3">{lang key='choosecurrency'}</p>
                                  <div class="row item-selector">
                                    <input type="hidden" name="currency" data-current="{$activeCurrency.id}" value="">
                                    {foreach $currencies as $selectCurrency}
                                      <div class="col-4">
                                        <a href="#" class="item{if $activeCurrency.id == $selectCurrency.id} active{/if}" data-value="{$selectCurrency.id}">
                                          {$selectCurrency.prefix} {$selectCurrency.code}
                                        </a>
                                      </div>
                                    {/foreach}
                                  </div>
                                {/if}
                              </div>
                            </div>
                            {* modal-actions *}
                            <div class="modal-actions d-flex align-items-center justify-content-end">
                              <button type="submit" class="btn btn-light btn-sm btn-wide">{lang key='apply'}</button>
                            </div>
                          </div>
                        </div>
                        {** localisation-modal : end **}
                        <div class="modal modal-localisation" id="modalChooseLanguages" tabindex="-1" role="dialog">
                          <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                              <div class="modal-body">
                                <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>

                                {if $languagechangeenabled && count($locales) > 1}
                                  <h5 class="h5 pt-5 pb-3">{lang key='chooselanguage'}</h5>
                                  <div class="row item-selector">
                                    <input type="hidden" name="language" data-current="{$language}" value="{$language}" />
                                    {foreach $locales as $locale}
                                      <div class="col-4">
                                        <a href="#" class="item{if $language == $locale.language} active{/if}" data-value="{$locale.language}">
                                          {$locale.localisedName}
                                        </a>
                                      </div>
                                    {/foreach}
                                  </div>
                                {/if}
                                {if !$loggedin && $currencies}
                                  <p class="h5 pt-5 pb-3">{lang key='choosecurrency'}</p>
                                  <div class="row item-selector">
                                    <input type="hidden" name="currency" data-current="{$activeCurrency.id}" value="">
                                    {foreach $currencies as $selectCurrency}
                                      <div class="col-4">
                                        <a href="#" class="item{if $activeCurrency.id == $selectCurrency.id} active{/if}" data-value="{$selectCurrency.id}">
                                          {$selectCurrency.prefix} {$selectCurrency.code}
                                        </a>
                                      </div>
                                    {/foreach}
                                  </div>
                                {/if}
                              </div>
                              <div class="modal-footer">
                                <button type="submit" class="btn btn-light">{lang key='apply'}</button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </form>

                    {if !$loggedin && $adminLoggedIn}
                      <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="btn btn-return-to-admin" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{lang key='adminmasqueradingasclient'} {lang key='logoutandreturntoadminarea'}{else}{lang key='adminloggedin'} {lang key='returntoadminarea'}{/if}">
                        <i class="fas fa-redo-alt"></i>
                        <span class="d-none d-md-inline-block">{lang key="admin.returnToAdmin"}</span>
                      </a>
                    {/if}

                    {include file="$template/includes/generate-password.tpl"}

                    {$footeroutput}
                    {assetExists file="immediate.js"}
                    <script src="{$__assetPath__}"></script>
                    {/assetExists}
                    {assetExists file="bundle.js"}
                    <script src="{$__assetPath__}"></script>
                    {/assetExists}
                    {assetExists file="theme.js"}
                    <script src="{$__assetPath__}"></script>
                    {/assetExists}

                    </body>

</html>