const initFavoritesToggle = () => {
  const btnsHeart = document.querySelectorAll('#btn-heart');
  const iconsHeart = document.querySelectorAll('#icon-heart');

  for(let i = 0; i < btnsHeart.length; i++) {
    btnsHeart[i].addEventListener('click', function() {
      iconsHeart[i].classList.toggle('far');
      iconsHeart[i].classList.toggle('fas');
    })
  }
}

export { initFavoritesToggle };