const initUpdateNavbarOnScroll = () => {
  const navbar = document.getElementById('navbar');
  const dropdown = document.querySelector('#dropdown');
  if (navbar) {
    window.addEventListener('scroll', (event) => {
      // console.log(event)
        console.log(window.scrollY)
      if (window.scrollY >= 90) {
        console.log(window.innerHeight)
        navbar.classList.add('transparent-navbar');
        dropdown.style.opacity = 1;
      } else {
        navbar.classList.remove('transparent-navbar');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };

