<section class="special-products-section section-padding-large">
  <div class="container-fluid">
    <!-- section-title -->
    {include file="$template/components/heading/HeroTitle.tpl" headline="{lang key="Amazing Products"}" tagline="{lang key="Create the perfect site with powerful drag and drop tools"}"}
    {* row *}
    <div class="row" data-gap-y="30px">
      {* col *}
      <div class="col-xl-6">
        {* premium-plan-card *}
        <div class="premium-plan-card --py-10 --px-8 h-100">
          {* plan-header *}
          <div class="plan-header --pb-7">
            {* row *}
            <div class="row align-items-center">
              {* col *}
              <div class="col-7">
                {* left-content *}
                <div class="left-content d-flex" data-gap-x="20px">
                  {* text-container *}
                  <div class="text-container pr-lg-5">
                    {* title *}
                    <h4 class="title --title-4 --font-semibold --color-foreground --mb-0">Ultimate Plan</h4>
                  </div>
                </div>
              </div>
              <div class="col-5 text-right">
                {* right-content *}
                <div class="right-content">
                  {* price *}
                  <div class="price" data-gap-x="5px">
                    <div class="discount --title-3 gradient-text gradient-primary --font-bold --font-heading">80% OFF</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          {* plan-body *}
          <div class="plan-body --pt-7">
            {* plan-text *}
            <p class="plan-text --mb-10">Enhance your site’s performance by delivering content globally, ensuring visitors experience faster loading times from the nearest server location.</p>
            {* plan-features *}
            <ul class="plan-features list-unstyled d-flex flex-column" data-gap-y="10px">
              {* feature-item *}
              <li class="feature-item d-flex align-items-md-center justify-content-between flex-md-row flex-column">
                <span class="text --text-sm --font-semibold --color-foreground">60GB SSD Storage</span>
                <span class="sub-text --color-muted-foreground">Fast, reliable storage.</span>
              </li>
              <li class="feature-item d-flex align-items-md-center justify-content-between flex-md-row flex-column">
                <span class="text --text-sm --font-semibold --color-foreground">Free .COM Domain</span>
                <span class="sub-text --color-muted-foreground --text-sm --font-medium">Free first year.</span>
              </li>
              <li class="feature-item d-flex align-items-md-center justify-content-between flex-md-row flex-column">
                <span class="text --text-sm --font-semibold --color-foreground">Free cPanel License</span>
                <span class="sub-text --color-muted-foreground --text-sm --font-medium">Easy hosting management.</span>
              </li>
              <li class="feature-item d-flex align-items-md-center justify-content-between flex-md-row flex-column">
                <span class="text --text-sm --font-semibold --color-foreground">Unlimited Bandwidth</span>
                <span class="sub-text --color-muted-foreground --text-sm --font-medium">Handle high traffic.</span>
              </li>
              <li class="feature-item d-flex align-items-md-center justify-content-between flex-md-row flex-column">
                <span class="text --text-sm --font-semibold --color-foreground">Free SSL Certificate</span>
                <span class="sub-text --color-muted-foreground --text-sm --font-medium">Secure your site.</span>
              </li>
              <li class="feature-item d-flex align-items-md-center justify-content-between flex-md-row flex-column">
                <span class="text --text-sm --font-semibold --color-foreground">24/7 Customer Support</span>
                <span class="sub-text --color-muted-foreground --text-sm --font-medium">Always available help.</span>
              </li>
              <li class="feature-item d-flex align-items-md-center justify-content-between flex-md-row flex-column">
                <span class="text --text-sm --font-semibold --color-foreground">Global CDN</span>
                <span class="sub-text --color-muted-foreground --text-sm --font-medium">Faster load speeds.</span>
              </li>
              <li class="feature-item d-flex align-items-md-center justify-content-between flex-md-row flex-column">
                <span class="text --text-sm --font-semibold --color-foreground">One-Click Installs</span>
                <span class="sub-text --color-muted-foreground --text-sm --font-medium">Easy app setup.</span>
              </li>
              <li class="feature-item d-flex align-items-md-center justify-content-between flex-md-row flex-column">
                <span class="text --text-sm --font-semibold --color-foreground">Daily Backups</span>
                <span class="sub-text --color-muted-foreground --text-sm --font-medium">Automatic data protection.</span>
              </li>
            </ul>
            {* plan-actions *}
            <div class="plan-actions --mt-10">
              <a href="#" class="nt-btn --btn-default">{lang key="Configure Plan"}</a>
            </div>
          </div>
        </div>
      </div>
      {* col *}
      <div class="col-xl-6">
        {* row *}
        <div class="row" data-gap-y="30px">
          {* col *}
          <div class="col-12">
            {* mini-plan-card *}
            <div class="mini-plan-card --py-8 --px-8">
              {* plan-header *}
              <div class="plan-header d-flex --mb-7" data-gap-x="15px">
                {* icon *}
                <div class="icon">
                  {include  file="$template/images/svg/elephant-origami.svg"}
                </div>
                {* text *}
                <div class="text">
                  <h4 class="title --title-4 --font-semibold --color-foreground --mb-1">VPS Hosting</h4>
                  <p class="sub-text --color-muted-foreground --text-sm">Scalable and powerful hosting.</p>
                </div>
              </div>
              {* plan-body *}
              <div class="plan-body">
                {* price-list *}
                <ul class="price-list list-unstyled d-flex flex-column mb-0" data-gap-y="5px">
                  {* price-item *}
                  <li class="price-item d-flex align-items-center justify-content-between --py-3 --px-3">
                    <span class="text --color-foreground --text-sm --font-semibold">4 vCPU Cores</span>
                    <span class="sub-text --color-muted-foreground --font-semibold">$49.99/mo</span>
                  </li>
                  {* price-item *}
                  <li class="price-item d-flex align-items-center justify-content-between --py-3 --px-3">
                    <span class="text --color-foreground --text-sm --font-semibold">8GB RAM</span>
                    <span class="sub-text --color-muted-foreground --font-semibold">$59.99/mo</span>
                  </li>
                  {* price-item *}
                  <li class="price-item d-flex align-items-center justify-content-between --py-3 --px-3">
                    <span class="text --color-foreground --text-sm --font-semibold">200GB SSD Storage</span>
                    <span class="sub-text --color-muted-foreground --font-semibold">$69.99/mo</span>
                  </li>
                  {* price-item *}
                  <li class="price-item d-flex align-items-center justify-content-between --py-3 --px-3">
                    <span class="text --color-foreground --text-sm --font-semibold">Unlimited Bandwidth</span>
                    <span class="sub-text --color-muted-foreground --font-semibold">$79.99/mo</span>
                  </li>
                  {* price-item *}
                  <li class="price-item d-flex align-items-center justify-content-between --py-3 --px-3">
                    <span class="text --color-foreground --text-sm --font-semibold">Free Domain</span>
                    <span class="sub-text --color-muted-foreground --font-semibold">$89.99/mo</span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          {* col *}
          <div class="col-12">
            {* mini-testimonial-card *}
            <div class="mini-testimonial-card position-relative d-flex align-items-center justify-content-md-between justify-content-center --py-9 --px-7">
              {* testimonial-icon *}
              {* testimonial-content *}
              <div class="testimonial-content text-md-left text-center">
                <h3 class="text --color-foreground --font-bold --title-2 gradient-text gradient-primary">+1M</h3>
                <h3 class="text --color-foreground --font-bold --title-2">Happy</h3>
                <h3 class="text --color-foreground --font-bold --title-2">Customers</h3>
              </div>
              {* testimonial-cards *}
              <div class="testimonial-cards d-md-flex d-none align-items-center justify-content-end">
                {* testimonial-card *}
                <div class="testimonial-card position-relative">
                  <img src={assetPath ns="images/users" file="avatar.png"} class="img-fluid" alt="" />
                </div>
                {* testimonial-card *}
                <div class="testimonial-card position-relative">
                  <img src={assetPath ns="images/users" file="avatar-2.png"} class="img-fluid" alt="" />
                </div>
                {* testimonial-card *}
                <div class="testimonial-card position-relative">
                  <img src={assetPath ns="images/users" file="avatar-3.png"} class="img-fluid" alt="" />
                </div>
                {* testimonial-card *}
                <div class="testimonial-card position-relative">
                  <img src={assetPath ns="images/users" file="avatar-4.png"} class="img-fluid" alt="" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>