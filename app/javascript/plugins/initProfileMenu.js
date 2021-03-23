

const initProfileMenu = () => {

  // making sure we are on the right page + selecting Libraryu link
  const libraryLink = document.querySelector('#profile-link-library');
  if (libraryLink) {

    console.log("Helooooooooooo")

    // selecting the second Link (to apply click listener) and both Lists (display or hide)
    const wishlistLink = document.querySelector('#profile-link-wishlist')
    const libraryList = document.querySelector('.profile-library')
    const wishlistList = document.querySelector('.profile-wishlist')

    // when clicking on library Link
    libraryLink.addEventListener('click', (event) => {
      event.preventDefault()
      libraryList.classList.remove("d-none")
      libraryLink.classList.add("active")
      wishlistList.classList.add("d-none")
      wishlistLink.classList.remove("active")
    })
    // when clicking on wishlist Link
    wishlistLink.addEventListener('click', (event) => {
      event.preventDefault()
      wishlistList.classList.remove("d-none")
      wishlistLink.classList.add("active")
      libraryList.classList.add("d-none")
      libraryLink.classList.remove("active")
    })
  }
}

export default initProfileMenu
