                    </div>

                    </div>
                    {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                      <div class="d-lg-none sidebar sidebar-secondary">
                        {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                      </div>
                    {/if}
                    <div class="clearfix"></div>
                    </div>
                    </div>
                    </section>

                    {if $templatefile !== 'login' && $templatefile !== 'register' && $templatefile !== 'passwordreset' && $templatefile !== 'contact'}
                      <!-- Theme Footer -->
                      <footer class="theme-footer">
                        <!-- footer-top -->
                        <div class="footer-top">
                          <div class="container-fluid">
                            <!-- footer-list-group -->
                            <div class="footer-list-group">
                              <!-- footer-list -->
                              <ul class="footer-list list-unstyled">
                                <li class="list-title">{lang key="footer_about_apexhost"}</li>
                                <li class="list-link"><a href="about-us.php">{lang key="footer_about_us"}</a></li>
                                <li class="list-link"><a href="news.php">{lang key="footer_newsroom"}</a></li>
                                <li class="list-link"><a href="contact.php">{lang key="footer_contact_us"}</a></li>
                                <li class="list-link"><a href="careers.php">{lang key="footer_careers"}</a></li>
                                <li class="list-link"><a href="legal.php">{lang key="footer_legal"}</a></li>
                              </ul>
                              <!-- footer-list -->
                              <ul class="footer-list list-unstyled">
                                <li class="list-title">{lang key="footer_help_center"}</li>
                                <li class="list-link"><a href="knowledgebase.php">{lang key="footer_knowledgebase"}</a></li>
                                <li class="list-link"><a href="networkstatus.php">{lang key="footer_network_status"}</a></li>
                                <li class="list-link"><a href="supporttickets.php">{lang key="footer_support_tickets"}</a></li>
                                <li class="list-link"><a href="contact.php">{lang key="footer_contact_support"}</a></li>
                                <li class="list-link"><a href="reportabuse.php">{lang key="footer_report_abuse"}</a></li>
                              </ul>
                              <!-- footer-list -->
                              <ul class="footer-list list-unstyled">
                                <li class="list-title">{lang key="footer_resources"}</li>
                                <li class="list-link"><a href="serverstatus.php">{lang key="footer_server_status"}</a></li>
                                <li class="list-link"><a href="downloads.php">{lang key="footer_downloads"}</a></li>
                                <li class="list-link"><a href="affiliates.php">{lang key="footer_affiliate_program"}</a></li>
                                <li class="list-link"><a href="announcements.php">{lang key="footer_announcements"}</a></li>
                                <li class="list-link"><a href="blog.php">{lang key="footer_blog"}</a></li>
                              </ul>
                              <!-- footer-list -->
                              <ul class="footer-list list-unstyled">
                                <li class="list-title">{lang key="footer_partner_programs"}</li>
                                <li class="list-link"><a href="affiliates.php">{lang key="footer_affiliates"}</a></li>
                                <li class="list-link"><a href="resellerprograms.php">{lang key="footer_reseller_programs"}</a></li>
                                <li class="list-link"><a href="partners.php">{lang key="footer_partners"}</a></li>
                              </ul>
                              <!-- footer-list -->
                              <ul class="footer-list list-unstyled">
                                <li class="list-title">{lang key="footer_account"}</li>
                                <li class="list-link"><a href="clientarea.php">{lang key="footer_client_area"}</a></li>
                                <li class="list-link"><a href="cart.php">{lang key="footer_shopping_cart"}</a></li>
                                <li class="list-link"><a href="register.php">{lang key="footer_register"}</a></li>
                                <li class="list-link"><a href="login.php">{lang key="footer_login"}</a></li>
                                <li class="list-link"><a href="pwreset.php">{lang key="footer_password_reset"}</a></li>
                              </ul>
                              <!-- footer-list -->
                              <ul class="footer-list list-unstyled">
                                <li class="list-title">{lang key="footer_services"}</li>
                                <li class="list-link"><a href="domainchecker.php">{lang key="footer_domain_search"}</a></li>
                                <li class="list-link"><a href="cart.php?gid=1">{lang key="footer_web_hosting"}</a></li>
                                <li class="list-link"><a href="cart.php?gid=2">{lang key="footer_reseller_hosting"}</a></li>
                                <li class="list-link"><a href="cart.php?gid=3">{lang key="footer_vps_hosting"}</a></li>
                                <li class="list-link"><a href="cart.php?gid=4">{lang key="footer_dedicated_servers"}</a></li>
                                <li class="list-link"><a href="cart.php?gid=5">{lang key="footer_ssl_certificates"}</a></li>
                              </ul>
                            </div>
                          </div>
                        </div>
                        <!-- footer-bottom -->
                        <div class="footer-bottom">
                          <div class="container-fluid">
                            <!-- content -->
                            <div class="content d-flex align-items-start mb-4 flex-lg-row flex-column" data-gap-y="30px" data-gap-x="30px">
                              <!-- logo -->
                              <div class="logo">
                                <a href="index.php">
                                  {if $assetLogoPath}
                                    <img src="{$assetLogoPath}" class="img-fluid" alt="{$companyname}">
                                  {else}
                                    {$companyname}
                                  {/if}
                                </a>
                              </div>
                              <!-- copyright -->
                              <div class="copyright">
                                <!-- links -->
                                <ul class="links list-unstyled d-flex align-items-center flex-wrap">
                                  <li><a href="terms.php">{lang key="footer_terms_of_use"}</a></li>
                                  <li><a href="privacy.php">{lang key="footer_privacy_policy"}</a></li>
                                  <li><a href="acceptableuse.php">{lang key="footer_acceptable_use"}</a></li>
                                  <li><a href="copyright.php">{lang key="footer_copyright"}</a></li>
                                </ul>
                                <!-- para-3 -->
                                <p class="para-3">{lang key="footer_copyright_text" year=$date_year company=$companyname}</p>
                              </div>
                              <!-- social-list -->
                              <ul class="social-list list-unstyled d-flex align-items-center justify-content-lg-end justify-content-center ml-lg-auto" data-gap-x="10px" data-gap-y="10px">
                                {foreach $socialAccounts as $account}
                                  <li class="footer-list-inline-item">
                                    <a class="theme-square-btn --fill-transparent-dark --icon-size-18" href="{$account->getUrl()}" target="_blank" title="{$account->getName()}">
                                      <i class="{$account->getFontAwesomeIcon()}"></i>
                                    </a>
                                  </li>
                                {/foreach}
                              </ul>
                            </div>
                            <!-- content -->
                            <div class="content d-lg-flex align-items-end flex-wrap">
                              <!-- para-3 -->
                              <p class="para-3">{lang key="footer_terms_notice_1"} <br> {lang key="footer_terms_notice_2"} <a href="terms.php">{lang key="footer_terms_of_use"}</a></p>
                              <!-- sign -->
                              <div class="signature ml-auto mt-lg-0 mt-3">
                                <p class="para-3">{lang key="footer_developed_by"} <a href="https://www.yourcompany.com" target="_blank">NiftyTheme</a></p>
                              </div>
                            </div>
                          </div>
                        </div>
                      </footer>
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
                            <button type="button" class="btn btn-default" data-dismiss="modal">
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
                                <button type="button" class="nt-square --btn-ghost" data-dismiss="modal" aria-label="Close">
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
                              <button type="submit" class="nt-btn --btn-default">{lang key='apply'}</button>
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
                                <button type="submit" class="btn btn-default">{lang key='apply'}</button>
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