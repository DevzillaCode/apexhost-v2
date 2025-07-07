<div class="modal modal-localisation" id="modalChooseLanguage" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-body">
                              <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>

                              {if $languagechangeenabled && count($locales) > 1}
                                <h5 class="h5 pt-1 pb-3">{lang key='chooselanguage'}</h5>
                                <div class="row item-selector small-gutters" data-gap-y="15px">
                                  <input type="hidden" name="language" data-current="{$language}" value="{$language}" />
                                  {foreach $locales as $locale}
                                    <div class="col-lg-3 col-md-4 col-sm-6">
                                      <a href="#" class="item{if $language == $locale.language} active{/if}" data-value="{$locale.language}" data-gap-x="10px">
                                        <img src="{$WEB_ROOT}/templates/apex/images/flags/{$locale.language}.svg" onerror="this.src='{$WEB_ROOT}/templates/apex/images/flags/default.png'" class="flag img-fluid" alt="{$locale.localisedName}" loading="lazy" />
                                        {$locale.localisedName}
                                        {if $language == $locale.language}
                                          <i class="fas fa-check check-icon ml-auto"></i>
                                        {/if}
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
                              <button type="submit" class="theme-btn --fill-light --wider-btn">{lang key='apply'}</button>
                            </div>
                          </div>
                        </div>
                      </div>