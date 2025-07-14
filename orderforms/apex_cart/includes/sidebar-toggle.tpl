<script>
  // Wait for the document to be fully loaded
  jQuery(document).ready(function() {
    // When the sidebar toggle button is clicked
    jQuery('#btnShowSidebar').click(function() {
      // Get references to the sidebar and cart body elements
      const $sidebar = jQuery("#cart-sidebar");
      const $cartBody = jQuery("#cart-body");

      if ($sidebar.is(":visible")) {
        // If the sidebar is visible:
        // 1. Hide the sidebar with a fade out effect
        $sidebar.fadeOut(300);
        setTimeout(function() {
          // 2. Expand the cart body after sidebar is hidden
          $cartBody.removeClass('cart-body-collapsed').addClass('cart-body-expanded');
          // 3. Change the button icon and text to "Show Menu"
          jQuery('#btnShowSidebar').html('<i class="fas fa-arrow-circle-right"></i> {$LANG.showMenu}');
        }, 300);
      } else {
        // If the sidebar is hidden:
        // 1. Shrink the cart body first
        $cartBody.removeClass('cart-body-expanded').addClass('cart-body-collapsed');
        // 2. Fade in the sidebar after shrinking the body
        setTimeout(function() {
          $sidebar.fadeIn(300);
          // 3. Change the button icon and text to "Hide Menu"
          jQuery('#btnShowSidebar').html('<i class="fas fa-arrow-circle-left"></i> {$LANG.hideMenu}');
        }, 300);
      }
    });
  });
</script>


{if $showSidebarToggle}
  <!-- Sidebar toggle button: Visible only if $showSidebarToggle is true -->
  <div class="sidebar-toggler">
    <button type="button" class="btn btn-light" id="btnShowSidebar">
      <!-- Icon and text for the toggle button. Changes dynamically via JS above. -->
      <i class="fas fa-arrow-circle-right"></i>
      {$LANG.showMenu}
    </button>
  </div>
{/if}