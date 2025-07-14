<div class="container-fluid py-5">
  <div class="row" data-gap-y="15px">
    <div class="col-12">
      {* Small Input Example: input-sm class for compact input fields. Includes icons on both sides. *}
      <div class="nt-form-group">
        {* label *}
        <label class="nt-label">Username</label>
        {* input-wrapper *}
        <div class="nt-input-wrapper">
          {* icon *}
          <div class="nt-input-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user">
              <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
              <circle cx="12" cy="7" r="4" />
            </svg>
          </div>
          {* input *}
          <input type="text" class="nt-input" placeholder="Username" aria-label="Username">
          {* icon *}
          <div class="nt-input-icon">
            {*
              Right icon (user):
              Can be replaced with another icon (e.g., show/hide password, clear input, etc.).
            *}
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user">
              <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
              <circle cx="12" cy="7" r="4" />
            </svg>
          </div>
        </div>
        {* description *}
        <p class="nt-input-description">
          This is a small input field with icons on both sides. It is suitable for compact forms or when space is limited.
        </p>
      </div>
    </div>
    <div class="col-12">
      {* Medium Input Example: default size, single icon on the left. *}
      <div class="nt-form-group">
        {* label *}
        <label class="nt-label">Password</label>
        {* input-wrapper *}
        <div class="nt-input-wrapper nt-input-size-lg">
          {* icon *}
          <div class="nt-float-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-lock-icon lucide-lock">
              <rect width="18" height="11" x="3" y="11" rx="2" ry="2" />
              <path d="M7 11V7a5 5 0 0 1 10 0v4" />
            </svg>
          </div>
          {* input *}
          <input type="password" class="nt-input" placeholder="Password" aria-label="Password">
        </div>
      </div>
    </div>
    <div class="col-12">
      {* Medium Input Example: default size, single icon on the left. *}
      <div class="nt-form-group">
        {* nt-checkbox *}
        <label for="remember-password" class="nt-checkbox">
          <input type="checkbox" class="" id="remember-password">
          <span class="checkmark"></span>
          Remember Password
        </label>
      </div>
    </div>
    <div class="col-12">
      {* Medium Input Example: default size, single icon on the left. *}
      <div class="nt-for-group nt-input-size-lg">
        {* nt-checkbox *}
        <label for="asd-password" class="nt-checkbox">
          <input type="checkbox" class="" id="asd-password">
          <span class="checkmark"></span>
          Remember Password
        </label>
      </div>
    </div>
  </div>
  <div class="d-flex align-items-center justify-content-start mt-4" data-gap-x="10px">
    <button class="btn btn-sm">Click Button</button>
    <button class="btn-square btn-sm">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-globe-icon lucide-globe">
        <circle cx="12" cy="12" r="10" />
        <path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20" />
        <path d="M2 12h20" />
      </svg>
    </button>
  </div>
  <div class="d-flex align-items-center justify-content-start mt-4" data-gap-x="10px">
    <button class="btn">Click Button</button>
    <button class="btn-square">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-at-sign-icon lucide-at-sign">
        <circle cx="12" cy="12" r="4" />
        <path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-4 8" />
      </svg>
    </button>
  </div>
  <div class="d-flex align-items-center justify-content-start mt-4" data-gap-x="10px">
    <button class="btn btn-lg">Click Button</button>
    <button class="btn-square btn-lg">
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-key-round-icon lucide-key-round">
        <path d="M2.586 17.414A2 2 0 0 0 2 18.828V21a1 1 0 0 0 1 1h3a1 1 0 0 0 1-1v-1a1 1 0 0 1 1-1h1a1 1 0 0 0 1-1v-1a1 1 0 0 1 1-1h.172a2 2 0 0 0 1.414-.586l.814-.814a6.5 6.5 0 1 0-4-4z" />
        <circle cx="16.5" cy="7.5" r=".5" fill="currentColor" />
      </svg>
    </button>
  </div>
  <div class="d-flex align-items-center justify-content-start mt-4" data-gap-x="10px">
    <button class="btn btn-primary btn-sm">Click<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-move-right-icon lucide-move-right">
        <path d="M18 8L22 12L18 16" />
        <path d="M2 12H22" />
      </svg></button>
    <button class="btn btn-secondary btn-sm">Click</button>
    <button class="btn btn-success btn-sm">Click</button>
    <button class="btn btn-danger btn-sm">Click</button>
    <button class="btn btn-warning btn-sm">Click</button>
    <button class="btn btn-info btn-sm">Click</button>
    <button class="btn btn-light btn-sm">Click</button>
    <button class="btn btn-dark btn-sm">Click</button>
    <button class="btn btn-ghost btn-sm">Click</button>
    <button class="btn btn-link btn-sm">Click</button>
  </div>
  <div class="d-flex align-items-center justify-content-start mt-4" data-gap-x="10px">
    <button class="btn btn-outline-primary">Click<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-move-right-icon lucide-move-right">
        <path d="M18 8L22 12L18 16" />
        <path d="M2 12H22" />
      </svg></button>
    <button class="btn btn-outline-secondary">Click</button>
    <button class="btn btn-outline-success">Click</button>
    <button class="btn btn-outline-danger">Click</button>
    <button class="btn btn-outline-warning">Click</button>
    <button class="btn btn-outline-info">Click</button>
    <button class="btn btn-outline-default">Click</button>
    <button class="btn btn-outline-dark">Click</button>
  </div>
  <div class="d-flex align-items-center justify-content-start mt-4" data-gap-x="10px">
    <div class="btn-group">
      <button class="btn btn-outline-primary">Click</button>
      <button class="btn btn-outline-secondary">Click</button>
      <button class="btn btn-outline-secondary">Click</button>
      <button class="btn btn-outline-secondary">Click</button>
      <button class="btn btn-outline-secondary">Click</button>
      <button class="btn btn-outline-secondary">Click</button>
      <button class="btn btn-outline-secondary">Click</button>
      <button class="btn btn-outline-primary">Click</button>
    </div>
  </div>
  {* Button sizes *}
  <div class="d-flex align-items-center justify-content-start mt-4" data-gap-x="10px">
    <button class="btn btn-primary btn-lg"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-git-branch-plus-icon lucide-git-branch-plus">
        <path d="M6 3v12" />
        <path d="M18 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
        <path d="M6 21a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
        <path d="M15 6a9 9 0 0 0-9 9" />
        <path d="M18 15v6" />
        <path d="M21 18h-6" />
      </svg>Click</button>
    <button class="btn btn-secondary btn-lg">Click</button>
    <button class="btn btn-success btn-lg">Click</button>
    <button class="btn btn-danger btn-lg">Click</button>
    <button class="btn btn-warning btn-lg">Click</button>
    <button class="btn btn-info btn-lg">Click</button>
    <button class="btn btn-light btn-lg">Click</button>
    <button class="btn btn-dark btn-lg">Click</button>
    <button class="btn btn-ghost btn-lg">Click</button>
    <button class="btn btn-link btn-lg">Click</button>
  </div>
  {* Buttons ghost *}
  <h1 class="title-3 mt-6">Buttons ghost</h1>
  <div class="d-flex align-items-center justify-content-start mt-4" data-gap-x="10px">
    <button class="btn btn-ghost-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-git-branch-plus-icon lucide-git-branch-plus">
        <path d="M6 3v12" />
        <path d="M18 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
        <path d="M6 21a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
        <path d="M15 6a9 9 0 0 0-9 9" />
        <path d="M18 15v6" />
        <path d="M21 18h-6" />
      </svg>Click</button>
    <button class="btn btn-ghost-secondary">Click</button>
    <button class="btn btn-ghost-success">Click</button>
    <button class="btn btn-ghost-danger">Click</button>
    <button class="btn btn-ghost-warning">Click</button>
    <button class="btn btn-ghost-info">Click</button>
    <button class="btn btn-ghost-light">Click</button>
    <button class="btn btn-ghost-dark">Click</button>
  </div>
  <div class="d-flex align-items-center justify-content-start mt-4" data-gap-x="10px">
    <div class="badge badge-primary">Primary</div>
    <div class="badge badge-secondary">Secondary</div>
    <div class="badge badge-success">Success</div>
    <div class="badge badge-danger">Danger</div>
    <div class="badge badge-warning">Warning</div>
    <div class="badge badge-info">Info</div>
    <div class="badge badge-light">Default</div>
    <div class="badge badge-dark">Dark</div>
  </div>
</div>