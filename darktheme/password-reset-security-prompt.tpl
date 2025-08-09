{if $errorMessage}
    <div class="alert-container">
        <div class="alert alert-danger alert-float" role="alert">
            <div>
                <!-- alert-icon -->
                <div class="alert-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-ban-icon lucide-ban">
                        <path d="M4.929 4.929 19.07 19.071" />
                        <circle cx="12" cy="12" r="10" />
                    </svg>
                </div>
                <!-- alert-content -->
                <div class="alert-content">
                    <!-- alert-message -->
                    <p class="alert-message">{$errorMessage}</p>
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

<p>{lang key='pwresetsecurityquestionrequired'}</p>

<form method="post" action="{routePath('password-reset-security-verify')}" class="form-stacked">
    <div class="form-group">
        <label for="inputAnswer">{$securityQuestion}</label>
        <input type="text" name="answer" class="form-control" id="inputAnswer" autofocus>
    </div>

    <div class="form-group text-center">
        <button type="submit" class="btn btn-primary">{lang key='pwresetsubmit'}</button>
    </div>
</form>