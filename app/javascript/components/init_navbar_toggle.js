const initNavbarToggle = () => {
  const mainMenu = document.querySelector(".mainMenu");
  const openMenu = document.querySelector(".openMenu");
  const closeMenu = document.querySelector(".closeMenu");

  openMenu.addEventListener('click', () => {
    // show menu
    mainMenu.style.display = 'flex';
    mainMenu.style.top = '0';
  });

  closeMenu.addEventListener('click', () => {
    // show menu
    mainMenu.style.top = '-100%';
  });
};

export { initNavbarToggle };
