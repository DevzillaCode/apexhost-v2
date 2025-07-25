<!-- Search form that submits to the download search route -->
<form role="form" method="post" action="{routePath('download-search')}">

  <!-- Form group with flexbox layout for horizontal alignment -->
  <div class="form-group d-flex align-items-center gap-4">

    <!-- Search input field -->
    <label for="inputDownloadsSearch" class="sr-only">{lang key='downloadssearch'}</label>
    <input type="text" name="search" id="inputDownloadsSearch" class="form-control" placeholder="{lang key='downloadssearch'}" autocomplete="off" />

    <!-- Search submit button with icon -->
    <button type="submit" id="btnDownloadsSearch" class="btn btn-light btn-wide">

      <!-- Search icon (Lucide icon set) -->
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search">
        <path d="m21 21-4.34-4.34" />
        <circle cx="11" cy="11" r="8" />
      </svg>

      <!-- Button text (translatable) -->
      {lang key='search'}
    </button>

  </div>
</form>