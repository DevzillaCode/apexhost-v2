/**
 * Bundle JS File
 *
 * @package     ApexHost
 * @author      NiftyTheme
 * @copyright   Copyright (c) NiftyTheme Limited 2017-2025
 * @version     1.0.0
 * @link        https://themeforest.net/user/niftytheme/
 */

// Handle gaps
function setGaps() {
  document.querySelectorAll('[data-gap-x], [data-gap-y]').forEach(element => {
    const gapX = element.getAttribute('data-gap-x');
    const gapY = element.getAttribute('data-gap-y');

    if (gapX) element.style.columnGap = gapX;
    if (gapY) element.style.rowGap = gapY;
  });
}

// Handle icon sizes
function setIconSizes() {
  document.querySelectorAll('[class*="--icon-size-"]').forEach(element => {
    // Convert classes to array and find the one with icon size
    const sizeClass = Array.from(element.classList)
      .find(className => className.startsWith('--icon-size-'));

    if (sizeClass) {
      const size = sizeClass.match(/--icon-size-(\d+)/)?.[1];
      if (size) {
        element.querySelectorAll('svg').forEach(svg => {
          svg.style.width = `${size}px`;
          svg.style.height = `${size}px`;
        });
        element.querySelectorAll('i').forEach(i => {
          i.style.fontSize = `${size}px`;
        });
      }
    }
  });
}

// Run both functions when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
  setGaps();
  setIconSizes();
});

// Optional: Run when new content is loaded dynamically
window.setGaps = setGaps;
window.setIconSizes = setIconSizes;