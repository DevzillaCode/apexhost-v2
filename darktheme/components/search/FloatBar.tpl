<div class="float-search-bar surface-composer" id="float-search-bar">
  {* content-area *}
  <form action="domainchecker.php" method="post" id="float-search-form" data-action-download="{routePath('download-search')}" data-action-knowledgebase="{routePath('knowledgebase-search')}" data-action-domain="domainchecker.php">
    {* content-area *}
    <div class="content-area" id="float-bar-content-area">
      {* div *}
      <div class="d-flex align-items-center" data-gap-x="10px">
        {* icon *}
        <div class="icon --icon-size-14">
          <svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 1000 1000">
            <path fill="currentColor" d="m746 641l254 255l-105 105l-254-254q-106 72-232 72q-169 0-289-120T0 410t120-289T409 1t289 120t120 289q0 127-72 231zm-65-231q0-113-79.5-193T409 137t-193 80t-80 193t80 192.5T409 682t192.5-79.5T681 410z" />
          </svg>
        </div>
        <input type="hidden" name="transfer" />
        <input type="text" name="search" class="float-bar-input" placeholder="exampledomain.com" autocapitalize="none" autocomplete="off">
      </div>
    </div>
    {* actions-bar *}
    <div class="actions-bar">
      {* div *}
      <div class="d-flex align-items-center justify-content-between" data-gap-x="6px">
        {* left-content *}
        <div class="left-content" id="float-bar-left-content">
          <div class="d-flex align-items-center" data-gap-x="6px">
            <button type="button" class="nt-btn nt-btn-outline-secondary nt-btn-size-sm nt-btn-pill active" id="float-bar-domain-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 24 24">
                <path fill="currentColor" d="M12 2C6.477 2 2 6.477 2 12s4.477 10 10 10s10-4.477 10-10S17.523 2 12 2zm6.918 6h-3.215a49.088 49.088 0 0 0-.565-3.357A8.048 8.048 0 0 1 18.918 8zm-5.904-3.928c.068.352.387 2.038.645 3.928h-3.318c.258-1.89.577-3.576.645-3.928C11.319 4.029 11.656 4 12 4s.681.029 1.014.072zM14 12c0 .598-.043 1.286-.109 2h-3.782c-.066-.714-.109-1.402-.109-2s.043-1.286.109-2h3.782c.066.714.109 1.402.109 2zM8.862 4.643A49.088 49.088 0 0 0 8.297 8H5.082a8.048 8.048 0 0 1 3.78-3.357zM4.263 10h3.821C8.033 10.668 8 11.344 8 12s.033 1.332.085 2H4.263C4.097 13.359 4 12.692 4 12s.098-1.359.263-2zm.819 6h3.215c.188 1.424.42 2.65.565 3.357A8.048 8.048 0 0 1 5.082 16zm5.904 3.928A77.282 77.282 0 0 1 10.341 16h3.318a78.303 78.303 0 0 1-.645 3.928c-.333.043-.67.072-1.014.072s-.681-.029-1.014-.072zm4.152-.571c.145-.707.377-1.933.565-3.357h3.215a8.048 8.048 0 0 1-3.78 3.357zM19.737 14h-3.821c.051-.668.084-1.344.084-2s-.033-1.332-.085-2h3.821c.166.641.264 1.308.264 2s-.097 1.359-.263 2z" />
              </svg>
              Domains
            </button>
            <button type="button" class="nt-btn nt-btn-outline-secondary nt-btn-size-sm nt-btn-pill" id="float-bar-knowledgebase-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 26 26">
                <path fill="currentColor" d="M8 5H3.5c-.3 0-.5.2-.5.5v13c0 .3.2.5.5.5H7c3 0 4 2 4 2h1V7c0-.1-1-2-4-2m1 10H6c-.5 0-1-.5-1-1s.5-1 1-1h3c.5 0 1 .5 1 1s-.5 1-1 1m0-4H6c-.5 0-1-.5-1-1s.5-1 1-1h3c.5 0 1 .5 1 1s-.5 1-1 1m5-4v14h1s1-2 4-2h3.5c.3 0 .5-.2.5-.5v-13c0-.3-.2-.5-.5-.5H18c-3 0-4 1.9-4 2m2 7c0-.5.5-1 1-1h3c.5 0 1 .5 1 1s-.5 1-1 1h-3c-.5 0-1-.5-1-1m0-4c0-.5.5-1 1-1h3c.5 0 1 .5 1 1s-.5 1-1 1h-3c-.5 0-1-.5-1-1" />
              </svg>
              Knowledgebase
            </button>
            <button type="button" class="nt-btn nt-btn-outline-secondary nt-btn-size-sm nt-btn-pill" id="float-bar-downloads-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 24 24">
                <path fill="currentColor" d="M8 17h8q.425 0 .713-.288T17 16q0-.425-.288-.713T16 15H8q-.425 0-.713.288T7 16q0 .425.288.713T8 17Zm3-6.85l-.9-.875Q9.825 9 9.412 9t-.712.3q-.275.275-.275.7t.275.7l2.6 2.6q.3.3.7.3t.7-.3l2.6-2.6q.275-.275.287-.688T15.3 9.3q-.275-.275-.688-.288t-.712.263l-.9.875V7q0-.425-.288-.713T12 6q-.425 0-.713.288T11 7v3.15ZM12 22q-2.075 0-3.9-.788t-3.175-2.137q-1.35-1.35-2.137-3.175T2 12q0-2.075.788-3.9t2.137-3.175q1.35-1.35 3.175-2.137T12 2q2.075 0 3.9.788t3.175 2.137q1.35 1.35 2.138 3.175T22 12q0 2.075-.788 3.9t-2.137 3.175q-1.35 1.35-3.175 2.138T12 22Zm0-2q3.35 0 5.675-2.325T20 12q0-3.35-2.325-5.675T12 4Q8.65 4 6.325 6.325T4 12q0 3.35 2.325 5.675T12 20Zm0-8Z" />
              </svg>
              Downloads
            </button>
          </div>
        </div>
        {* right-content *}
        <div class="right-content d-flex align-items-center" data-gap-x="6px">
          <button type="submit" class="nt-btn nt-btn-default nt-btn-size-sm nt-btn-pill" id="float-search-btn">
            <svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 1000 1000">
              <path fill="currentColor" d="m746 641l254 255l-105 105l-254-254q-106 72-232 72q-169 0-289-120T0 410t120-289T409 1t289 120t120 289q0 127-72 231zm-65-231q0-113-79.5-193T409 137t-193 80t-80 193t80 192.5T409 682t192.5-79.5T681 410z" />
            </svg>
            Search
          </button>
          {* toggler *}
          <button type="button" class="nt-square-btn nt-btn-default nt-btn-size-sm nt-btn-pill" id="float-bar-toggler">
            <svg class="_expand_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
              <g fill="currentColor">
                <path d="M5.707 15.707a1 1 0 0 1-1.414-1.414l4-4a1 1 0 1 1 1.414 1.414l-4 4Z" />
                <path d="M5 16a1 1 0 1 1 0-2h4a1 1 0 1 1 0 2H5Z" />
                <path d="M6 15a1 1 0 1 1-2 0v-4a1 1 0 1 1 2 0v4Zm5.707-5.293a1 1 0 0 1-1.414-1.414l4-4a1 1 0 1 1 1.414 1.414l-4 4Z" />
                <path d="M16 9a1 1 0 1 1-2 0V5a1 1 0 1 1 2 0v4Z" />
                <path d="M11 6a1 1 0 1 1 0-2h4a1 1 0 1 1 0 2h-4Z" />
              </g>
            </svg>
            <svg class="_collapse_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
              <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M1.75 10.75h3.5v3.5m5.5 0v-3.5h3.5m0-5.5h-3.5v-3.5m-5.5 0v3.5h-3.5" />
            </svg>
          </button>
        </div>
      </div>
    </div>
  </form>
</div>