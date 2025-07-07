document.addEventListener("DOMContentLoaded", function () {
  const preloader = document.getElementById("preloader");

  window.addEventListener('load', () => {
    // Add the 'hide' class to trigger the fade-out animation
    preloader.classList.add('hide');

    // Optionally, remove the loader from the DOM after the animation completes
    preloader.addEventListener('transitionend', () => {
      preloader.remove(); // Remove the loader from the DOM
    }, { once: true }); // Ensure the event listener is removed after firing once
  });
});