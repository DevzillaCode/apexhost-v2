/**
 * WHMCS Dropdown and UI Interaction Script
 * Clean, modular, and documented for ThemeForest standards.
 * Dependencies: jQuery (ensures cross-browser compatibility and ease of use)
 */

$(function () {
  /**
   * :: Main Navigation Dropdown Toggle
   * Adds/removes `.show` on the clicked `.link-wrapper` and hides others.
   */
  function toggleDropdown($trigger) {
    const $parent = $trigger.closest(".link-wrapper");
    const $dropdown = $parent.find(".theme-dropdown-menu");

    if ($parent.hasClass("show")) {
      $dropdown.hide();
      $parent.removeClass("show");
    } else {
      $(".link-wrapper.show .theme-dropdown-menu").hide();
      $(".link-wrapper.show").removeClass("show");
      $parent.addClass("show");
      $dropdown.show();
    }
  }

  $('[data-type="dropdown_menu_toggler"]').on("click", function (e) {
    e.preventDefault();
    e.stopPropagation();
    toggleDropdown($(this));
    closeUserDropdown(); // Ensure only one menu open at a time
  });

  /**
   * :: User Dropdown Toggle
   * Manages toggling of user options and active button state.
   */
  function toggleUserDropdown() {
    $("#user_options").toggleClass("show");
    $('[data-type="user_dropdown_menu_toggler"]').toggleClass("active");
  }

  $('[data-type="user_dropdown_menu_toggler"]').on("click", function (e) {
    e.preventDefault();
    e.stopPropagation();
    toggleUserDropdown();
    closeMainDropdown();
  });

  /**
   * :: Close dropdowns when clicking outside
   * Ensures menus are closed on document interaction.
   */
  $(document).on("click", function (e) {
    if (
      !$(e.target).closest(
        ".dropdown-menu, [data-type='dropdown_menu_toggler']"
      ).length
    ) {
      closeMainDropdown();
    }
    if (
      !$(e.target).closest(
        "#user_dropdown_menu, [data-type='user_dropdown_menu_toggler']"
      ).length
    ) {
      closeUserDropdown();
    }
  });

  function closeMainDropdown() {
    $(".link-wrapper.show .theme-dropdown-menu").stop(true, true).slideUp(200);
    $(".link-wrapper.show").removeClass("show");
  }

  function closeUserDropdown() {
    $("#user_options").removeClass("show");
    $('[data-type="user_dropdown_menu_toggler"]').removeClass("active");
  }

  /**
   * :: Dynamic Body Padding
   * Adjusts top padding based on topbar and navbar height.
   */
  function setBodyPaddingTop() {
    const topbarHeight = $("#theme-topbar").outerHeight() || 0;
    const navbarHeight = $("#theme-navbar").outerHeight() || 0;
    $("body").css("padding-top", topbarHeight + navbarHeight);
  }

  setBodyPaddingTop();
  $(window).on("resize", setBodyPaddingTop);

  /**
   * :: Responsive Navbar Links
   * Show/hide navbar links for smaller viewports.
   */
  $("#links-toggler").on("click", function () {
    $("#theme-navbar").toggleClass("show-links");
  });

  $("#close-links").on("click", function () {
    $("#theme-navbar").removeClass("show-links");
  });

  /**
   * :: Scroll Behavior for Sticky Topbar and Navbar
   * Also handles animated background movement.
   */
  $(window)
    .on("scroll", function () {
      const scrollTop = $(window).scrollTop();
      const $topbar = $("#theme-topbar");
      const $navbar = $("#theme-navbar");

      if ($topbar.length) {
        if (scrollTop > $topbar.outerHeight()) {
          $topbar.css("top", `-${$topbar.outerHeight()}px`);
          $navbar.css("top", "0");
        } else {
          $topbar.css("top", "0");
          $navbar.css("top", `${$topbar.outerHeight()}px`);
        }
      } else {
        $navbar.css("top", "0");
      }

      // :: Animate background position on scroll
      const $animatedBg = $(".theme-navbar.has-animated-bg .animated-bg");
      if ($animatedBg.length) {
        const maxScroll = 200;
        const initialBottom = 90;
        const newBottom = Math.min(
          initialBottom + (scrollTop / maxScroll) * 100,
          100
        );
        $animatedBg.css("bottom", `${newBottom}%`);
      }
    })
    .trigger("scroll");

  /**
   * :: Collapsible Sidebar Panels
   * Allows toggle for sidebar sections.
   */
  $(".toggler-sidebar-panel .panel-heading").on("click", function () {
    const $panel = $(this).closest(".toggler-sidebar-panel");
    $panel.find(".panel-body").slideToggle(300);
    $(this).toggleClass("active");
  });

  /**
   * :: Floating Search Bar Animation
   * Handles expand/collapse behavior of the floating search input.
   */
  var isSearchBarExpanded = false;
  var isSearchBarAnimating = false;
  var $floatSearchBar = $("#float-search-bar");
  var $floatSearchBtn = $("#float-search-btn");
  var $floatBarToggler = $("#float-bar-toggler");
  var $searchInput = $(".float-bar-input");

  // Append overlay for body dimming
  const $overlay = $('<div class="float-bar-overlay"></div>')
    .hide()
    .appendTo("body");

  function expandSearchBar() {
    if (isSearchBarAnimating || isSearchBarExpanded) return;
    isSearchBarAnimating = true;
    $floatSearchBar.addClass("bar-is-active");
    $("body").addClass("float-bar-open");
    $overlay.fadeIn(300);
    setTimeout(function () {
      $floatSearchBtn.prop("disabled", false);
      isSearchBarAnimating = false;
      isSearchBarExpanded = true;
      $searchInput.focus();
    }, 600);
  }

  function collapseSearchBar() {
    if (isSearchBarAnimating || !isSearchBarExpanded) return;
    isSearchBarAnimating = true;
    $floatSearchBtn.prop("disabled", true);
    $floatSearchBar.removeClass("bar-is-active");
    $("body").removeClass("float-bar-open");
    $overlay.fadeOut(300);
    setTimeout(function () {
      isSearchBarAnimating = false;
      isSearchBarExpanded = false;
    }, 600);
  }

  $floatBarToggler.on("click", function () {
    isSearchBarExpanded ? collapseSearchBar() : expandSearchBar();
  });

  // Close search bar with ESC key
  $(document).on("keydown", function (e) {
    if (e.key === "Escape" && isSearchBarExpanded) {
      collapseSearchBar();
    }
  });

  // Close on outside click
  $(document).on("click", function (e) {
    if (isSearchBarExpanded && !$(e.target).closest($floatSearchBar).length) {
      collapseSearchBar();
    }
  });

  // Prevent propagation inside search bar
  $floatSearchBar.on("click", function (e) {
    e.stopPropagation();
  });

  $floatSearchBtn.prop("disabled", true);

  /**
   * :: Dynamic Dropdown Positioning
   * Aligns user dropdown left or right based on available space.
   */
  function positionDropdownHorizontally($dropdown, $trigger) {
    $dropdown.css({ visibility: "hidden", display: "block" });

    const dropdownWidth = $dropdown.outerWidth();
    const triggerOffset = $trigger.offset();
    const spaceRight =
      $(window).width() - (triggerOffset.left + $trigger.outerWidth());
    const spaceLeft = triggerOffset.left;

    $dropdown.removeClass("drop-left drop-right");
    if (spaceRight >= dropdownWidth) {
      $dropdown.addClass("drop-right");
    } else if (spaceLeft >= dropdownWidth) {
      $dropdown.addClass("drop-left");
    }

    $dropdown.css({ display: "", visibility: "" });
  }

  const $userTrigger = $('[data-type="user_dropdown_menu_toggler"]');
  const $userDropdown = $("#user_dropdown_menu");

  $userTrigger.on("mouseenter", function () {
    positionDropdownHorizontally($userDropdown, $userTrigger);
  });

  /**
   * :: Form Action Control (for Floating Search)
   * Changes the form action dynamically based on clicked search category,
   * updates active button class and placeholder.
   */
  const $searchForm = $("#float-search-form");

  const domainAction = $searchForm.data("action-domain");
  const downloadAction = $searchForm.data("action-download");
  const kbAction = $searchForm.data("action-knowledgebase");

  function updateSearchContext(actionUrl, activeBtnId, placeholderText) {
    $searchForm.attr("action", actionUrl);
    $searchInput.attr("placeholder", placeholderText);
    $(
      "#float-bar-domain-btn, #float-bar-downloads-btn, #float-bar-knowledgebase-btn"
    ).removeClass("active");
    $(activeBtnId).addClass("active");
  }

  $("#float-bar-domain-btn").on("click", function () {
    updateSearchContext(
      domainAction,
      "#float-bar-domain-btn",
      "exampledomain.com"
    );
  });

  $("#float-bar-downloads-btn").on("click", function () {
    updateSearchContext(
      downloadAction,
      "#float-bar-downloads-btn",
      "Search downloads"
    );
  });

  $("#float-bar-knowledgebase-btn").on("click", function () {
    updateSearchContext(
      kbAction,
      "#float-bar-knowledgebase-btn",
      "Search articles"
    );
  });

  /**
   * :: Infinite Horizontal Scrolling
   * Applies continuous scrolling effect to specific rows with hover pause.
   */
  const scrollSettings = [
    { id: "quick-actions-row-1", direction: -1 },
    { id: "quick-actions-row-2", direction: 1 },
    { id: "quick-actions-row-3", direction: -1 },
  ];

  scrollSettings.forEach((setting) => {
    const row = document.getElementById(setting.id);
    if (!row) return; // Prevent error if element not found

    const container = row.parentElement;
    if (!container) return; // Just in case

    let position = 0;
    let speed = 0.4;
    let targetSpeed = 0.4;
    const dir = setting.direction;

    const update = () => {
      position += dir * speed;
      row.style.transform = `translateX(${position}px)`;

      const rowWidth = row.scrollWidth / 2;
      const containerWidth = container.offsetWidth;

      if (dir === -1 && Math.abs(position) >= rowWidth) {
        position = 0;
      } else if (dir === 1 && position >= 0) {
        position = -rowWidth;
      }

      speed += (targetSpeed - speed) * 0.1;
      requestAnimationFrame(update);
    };

    update();

    row.querySelectorAll(".action-item").forEach((item) => {
      item.addEventListener("mouseenter", () => (targetSpeed = 0));
      item.addEventListener("mouseleave", () => (targetSpeed = 0.4));
    });
  });

  /**
   * :: Show/Hide Password Toggle
   * Handles toggling the visibility of a password input field using an eye icon button.
   * Displays the appropriate icon depending on the current visibility state.
   */
  const $toggleBtn = $("#show-password-btn");
  const $passwordInput = $("#password");
  const $showIcon = $("#show-svg");
  const $hideIcon = $("#hide-svg");

  // Ensure all elements exist
  if (!$toggleBtn.length || !$passwordInput.length) return;

  // Initial icon setup
  $showIcon.show();
  $hideIcon.hide();

  // Toggle visibility
  $toggleBtn.on("click", function () {
    const isHidden = $passwordInput.attr("type") === "password";

    $passwordInput.attr("type", isHidden ? "text" : "password");
    $showIcon.toggle(!isHidden);
    $hideIcon.toggle(isHidden);
  });
});

/**
 * Reorganizes DataTables elements by moving filter and info controls
 * outside the listtable container and adds responsive styling.
 *
 * Structure created:
 * [filter] (search input)
 * [info] (showing X of Y entries)
 * [listtable] (now with responsive wrapper)
 */
$(function () {
  // =============================================
  // CONFIGURATION - Edit these values as needed
  // =============================================
  const CONFIG = {
    // Element selectors
    selectors: {
      listTable: ".listtable",
      filter: "#tableEmailsList_filter",
      info: "#tableEmailsList_info",
    },

    // Classes to add to elements
    classes: {
      listTable: "table-responsive mb-10 border rounded-md", // Responsive wrapper for the table
      filter: "", // Margin below filter
      info: "", // Margin below info
    },

    // Insertion method ('before' or 'after' existing elements)
    insertMethod: "before",
  };

  // =============================================
  // VALIDATION - Check if required elements exist
  // =============================================
  if (!$(CONFIG.selectors.listTable).length) {
    console.error("Listtable element not found:", CONFIG.selectors.listTable);
    return; // Exit if main container doesn't exist
  }

  // =============================================
  // ELEMENT REORGANIZATION
  // =============================================

  // Move filter element (search input)
  if ($(CONFIG.selectors.filter).length) {
    $(CONFIG.selectors.listTable)[CONFIG.insertMethod](
      $(CONFIG.selectors.filter)
    );
    $(CONFIG.selectors.filter).addClass(CONFIG.classes.filter);
  } else {
    console.warn("Filter element not found:", CONFIG.selectors.filter);
  }

  // Move info element ("Showing X of Y entries")
  if ($(CONFIG.selectors.info).length) {
    $(CONFIG.selectors.listTable)[CONFIG.insertMethod](
      $(CONFIG.selectors.info)
    );
    $(CONFIG.selectors.info).addClass(CONFIG.classes.info);
  } else {
    console.warn("Info element not found:", CONFIG.selectors.info);
  }

  // =============================================
  // STYLING ENHANCEMENTS
  // =============================================
  $(CONFIG.selectors.listTable).addClass(CONFIG.classes.listTable);

  // =============================================
  // OPTIONAL: DEBUG OUTPUT
  // =============================================
  if (console.debug) {
    console.debug("DataTables reorganization completed:", {
      filterPosition: $(CONFIG.selectors.filter).length ? "moved" : "not found",
      infoPosition: $(CONFIG.selectors.info).length ? "moved" : "not found",
      listTableClasses: $(CONFIG.selectors.listTable).attr("class"),
    });
  }
});

/**
 * Reorganizes DataTables controls by creating a flex container
 * and moving pagination and length menu elements into it.
 *
 * Structure created:
 * [listtable] (existing element)
 * [flexContainer]
 *   ├── [leftContainer] (contains pagination controls)
 *   └── [rightContainer] (contains length menu)
 */
$(function () {
  // =============================================
  // CONFIGURATION - Edit these classes as needed
  // =============================================
  const FLEX_CONTAINER_CLASSES ="d-flex justify-content-between align-items-center flex-lg-row flex-column gap-lg-0 gap-4";
  const SUB_CONTAINER_CLASSES = "d-flex align-items-center justify-content-lg-start justify-content-center gap-3";

  // =============================================
  // ELEMENT SELECTORS - Update if IDs/classes change
  // =============================================
  const SELECTORS = {
    listTable: ".listtable",
    paginate: ".dataTables_paginate",
    length: ".dataTables_length",
  };

  // =============================================
  // CONTAINER CREATION
  // =============================================

  // Main flex container that holds both left and right sections
  const $flexContainer = $("<div>").addClass(FLEX_CONTAINER_CLASSES);

  // Left container - will hold pagination controls
  const $leftContainer = $("<div>").addClass(SUB_CONTAINER_CLASSES);

  // Right container - will hold length menu
  const $rightContainer = $("<div>").addClass(SUB_CONTAINER_CLASSES);

  // =============================================
  // ELEMENT REORGANIZATION
  // =============================================

  // Move pagination controls to left container
  if ($(SELECTORS.paginate).length) {
    $leftContainer.append($(SELECTORS.paginate));
  } else {
    console.warn("Pagination element not found:", SELECTORS.paginate);
  }

  // Move length menu to right container
  if ($(SELECTORS.length).length) {
    $rightContainer.append($(SELECTORS.length));
  } else {
    console.warn("Length menu element not found:", SELECTORS.length);
  }

  // =============================================
  // DOM STRUCTURE ASSEMBLY
  // =============================================

  // Combine containers
  $flexContainer.append($leftContainer, $rightContainer);

  // Insert the new container after the listtable
  // Change to .before() if you want it above the table
  if ($(SELECTORS.listTable).length) {
    $(SELECTORS.listTable).after($flexContainer);
  } else {
    console.error("Listtable element not found:", SELECTORS.listTable);
  }
});
