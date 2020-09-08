const initNavbar = () => {
  const pageContainer = document.querySelector('.container-home')
  if (pageContainer) {
  let prevScrollpos = pageContainer.scrollTop;

  const navbar = document.getElementById("navbar")
  pageContainer.addEventListener('scroll', event => {
    const currentScrollPos = pageContainer.scrollTop;
    if (prevScrollpos > currentScrollPos) {
      navbar.style.top = "0";
    } else {
      navbar.style.top = "-162px";
    }
    prevScrollpos = currentScrollPos;
  })
  }
}

export { initNavbar }
