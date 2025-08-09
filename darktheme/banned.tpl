<div class="alert-container">
      <div class="alert alert-danger">
        <div>
          {* alert-icon *}
          <div class="alert-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-ban-icon lucide-ban">
              <path d="M4.929 4.929 19.07 19.071" />
              <circle cx="12" cy="12" r="10" />
            </svg>
          </div>
          {* alert-content *}
          <div class="alert-content">
            {* alert-message *}
            <h2 class="alert-title">
              {lang key='bannedyourip'}
              {$ip}
              {lang key='bannedhasbeenbanned'}
            </h2>
            {* alert-list *}
            <ul class="alert-list">
              <li>
                {lang key='bannedbanreason'}:
                {$reason}
              </li>
              <li>
                {lang key='bannedbanexpires'}:
                {$expires}
              </li>
            </ul>
          </div>
          {* close-alert *}
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