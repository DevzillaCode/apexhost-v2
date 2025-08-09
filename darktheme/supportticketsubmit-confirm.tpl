<div class="card">
    <div class="card-body extra-padding">

        <h3 class="card-title">{lang key="createNewSupportRequest"}</h3>

        <div class="alert-container">
            <div class="alert alert-success alert-float" role="alert">
                <div>
                    <!-- alert-icon -->
                    <div class="alert-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-check-circle-icon lucide-check-circle">
                            <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14" />
                            <polyline points="22 4 12 14.01 9 11.01" />
                        </svg>
                    </div>
                    <!-- alert-content -->
                    <div class="alert-content">
                        <!-- alert-message -->
                        <p class="alert-message">
                            {lang key='supportticketsticketcreated'}
                            <a id="ticket-number" href="viewticket.php?tid={$tid}&amp;c={$c}" class="alert-link">#{$tid}</a>
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

        <div class="row">
            <div class="col-10 offset-1">
                <p>{lang key='supportticketsticketcreateddesc'}</p>
            </div>
        </div>

        <br />

        <p class="text-center">
            <a href="viewticket.php?tid={$tid}&amp;c={$c}" class="btn btn-light">
                {lang key='continue'}
                <i class="fas fa-arrow-circle-right"></i>
            </a>
        </p>

    </div>
</div>