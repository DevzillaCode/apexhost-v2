{if $openNetworkIssueCounts.open > 0}
  <div class="alert-container">
    <div class="alert alert-warning alert-float" role="alert">
      <div>
        <!-- alert-icon -->
        <div class="alert-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-alert-triangle-icon lucide-alert-triangle">
            <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z" />
            <line x1="12" y1="9" x2="12" y2="13" />
            <line x1="12" y1="17" x2="12.01" y2="17" />
          </svg>
        </div>
        <!-- alert-content -->
        <div class="alert-content">
          <!-- alert-message -->
          <p class="alert-message">
          <div class="container">
            {lang key='networkIssuesAware'}
            <a href="{$WEB_ROOT}/serverstatus.php" class="alert-link float-lg-right">
              {lang key='learnmore'}
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right">
                <line x1="5" y1="12" x2="19" y2="12" />
                <polyline points="12 5 19 12 12 19" />
              </svg>
            </a>
          </div>
          </p>
        </div>
        <!-- close-alert -->
        <div class="alert-dismissible">
          <button type="button" class="alert-close-btn" data-dismiss="alert" aria-label="Close">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x-icon lucide-circle-x">
              <circle cx="12" cy="12" r="10" />
              <path d="m15 9-6 6" />
              <path d="m9 9 6 6" />
            </svg>
          </button>
        </div>
      </div>
    </div>
  </div>
{elseif $openNetworkIssueCounts.scheduled > 0}
  <div class="alert-container">
    <div class="alert alert-info alert-float" role="alert">
      <div>
        <!-- alert-icon -->
        <div class="alert-icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-info-icon lucide-info">
            <circle cx="12" cy="12" r="10" />
            <line x1="12" y1="16" x2="12" y2="12" />
            <line x1="12" y1="8" x2="12.01" y2="8" />
          </svg>
        </div>
        <!-- alert-content -->
        <div class="alert-content">
          <!-- alert-message -->
          <p class="alert-message">
          <div class="container">
            {lang key='networkIssuesScheduled'}
            <a href="{$WEB_ROOT}/serverstatus.php" class="alert-link float-lg-right">
              {lang key='learnmore'}
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-right-icon lucide-arrow-right">
                <line x1="5" y1="12" x2="19" y2="12" />
                <polyline points="12 5 19 12 12 19" />
              </svg>
            </a>
          </div>
          </p>
        </div>
        <!-- close-alert -->
        <div class="alert-dismissible">
          <button type="button" class="alert-close-btn" data-dismiss="alert" aria-label="Close">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x-icon lucide-circle-x">
              <circle cx="12" cy="12" r="10" />
              <path d="m15 9-6 6" />
              <path d="m9 9 6 6" />
            </svg>
          </button>
        </div>
      </div>
    </div>
  </div>
{/if}