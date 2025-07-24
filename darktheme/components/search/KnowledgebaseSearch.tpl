<form role="form" method="post" action="{routePath('knowledgebase-search')}">
  <div class="form-group d-flex align-items-center gap-4">
    <label for="inputKnowledgebaseSearch" class="sr-only">{lang key='clientHomeSearchKb'}</label>
    <input class="form-control" id="inputKnowledgebaseSearch" name="search" placeholder="{lang key='clientHomeSearchKb'}" autocomplete="off" />
    <button type="submit" class="btn btn-light btn-wide" id="btnKnowledgebaseSearch"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-icon lucide-search">
        <path d="m21 21-4.34-4.34" />
        <circle cx="11" cy="11" r="8" />
      </svg>{lang key='search'}</button>
  </div>
</form>