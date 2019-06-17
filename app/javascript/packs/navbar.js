wconst initUpdateNavbarOnScroll = () => {
  const navbar = document.getElementById('navbar');
  const dropdown = document.querySelector('#dropdown');
  const black = document.querySelectorAll('.black')
  if (navbar) {
    window.addEventListener('scroll', (event) => {
      // console.log(event)
        console.log(window.scrollY)
      if (window.scrollY >= 90) {
        navbar.classList.add('transparent-navbar');
        dropdown.style.opacity = 1;
        black.forEach((element) => {
          element.classList.add('white');
      });
      } else {
        navbar.classList.remove('transparent-navbar');
        black.forEach((element) => {
          element.classList.remove('white');
        });
      }
    });
  }
}

export { initUpdateNavbarOnScroll };

const initOpacityOnScroll = () => {
  const dropdown = document.querySelector('#dropdown');
  if (dropdown) {
    window.addEventListener('scroll', (event) => {
      if (window.scrollY >= 90) {
        dropdown.style.opacity = 1;
      } else {
      }
    })
  }
}

export { initOpacityOnScroll };
