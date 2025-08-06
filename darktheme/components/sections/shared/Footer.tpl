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
      <div class="content d-flex align-items-start mb-4 flex-lg-row flex-column row-gap-8 col-gap-8">
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
        <ul class="social-list list-unstyled d-flex align-items-center justify-content-lg-end justify-content-center ml-lg-auto row-gap-3 col-gap-3">
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