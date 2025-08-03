<form action="#" id="frmGeneratePassword">
  <div class="modal wide-modal fade" id="modalGeneratePassword">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">
            {lang key='generatePassword.title'}
          </h4>
          <button type="button" class="close-btn btn-square btn-ghost-light btn-xs rounded-circle" data-dismiss="modal" aria-label="Close">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x-icon lucide-x">
              <path d="M18 6 6 18"></path>
              <path d="m6 6 12 12"></path>
            </svg>
          </button>
        </div>
        <div class="modal-body">
          <div class="alert alert-danger w-hidden" id="generatePwLengthError">
            <div>
              {lang key='generatePassword.lengthValidationError'}
            </div>
          </div>
          <div class="form-group mb-4">
            <label for="inputGeneratePasswordLength" class="form-label">{lang key='generatePassword.pwLength'}</label>
            <input type="number" id="inputGeneratePasswordLength" min="8" max="64" value="12" step="1" class="form-control">
          </div>
          <div class="form-group mb-4">
            <label for="inputGeneratePasswordOutput" class="form-label">{lang key='generatePassword.generatedPw'}</label>
            <input type="text" id="inputGeneratePasswordOutput" class="form-control">
          </div>
          {* !!WORKSPACE!! *}
          <div class="row">
            <div class="col-12">
              <button type="submit" class="btn btn-semi-ghost-info btn-xs" id="btnGenerateNew">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus-icon lucide-plus">
                  <path d="M5 12h14" />
                  <path d="M12 5v14" />
                </svg>
                {lang key='generatePassword.generateNew'}
              </button>
              <button type="button" class="btn btn-semi-ghost-light btn-xs copy-to-clipboard" data-clipboard-target="#inputGeneratePasswordOutput">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-copy-icon lucide-copy">
                  <rect width="14" height="14" x="8" y="8" rx="2" ry="2" />
                  <path d="M4 16c-1.1 0-2-.9-2-2V4c0-1.1.9-2 2-2h10c1.1 0 2 .9 2 2" />
                </svg>
                {lang key='copy'}
              </button>
            </div>
          </div>
          {* !!WORKSPACE!! *}
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-ghost-light btn-xs btn-wide" data-dismiss="modal">
            {lang key='close'}
          </button>
          <button type="submit" class="btn btn-primary btn-xs btn-wide" id="btnGeneratePasswordInsert">
            {lang key='generatePassword.copyAndInsert'}
          </button>
        </div>
      </div>
    </div>
  </div>
</form>