const initScrollClick = () => {
  const allNextButtons = document.querySelectorAll(".size-select")
  allNextButtons.forEach(button => {
  button.addEventListener('click', event => {
    document.querySelector(event.currentTarget.dataset.section).scrollIntoView({behavior: 'smooth'})
  })
  })
}

export { initScrollClick }
