const initFavoritesToggle = () => {
  const btnHeart = document.getElementById('btn-heart');
  const iconHeart = document.getElementById('icon-heart');

  btnHeart.addEventListener('click', function() {
    iconHeart.classList.toggle('far');
    iconHeart.classList.toggle('fas');
  })
}

export { initFavoritesToggle };