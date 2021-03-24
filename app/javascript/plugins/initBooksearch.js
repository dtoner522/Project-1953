
const extractData = (data) => {

  // Extract dataset + fill the form inputs

  const formBookTitle = document.querySelector('#book_title')
  formBookTitle.value = data.title

  const formBookAuthor = document.querySelector('#book_author')
  formBookAuthor.value = data.author

  const formBookYear = document.querySelector('#book_year')
  formBookYear.value = data.year

  const formBookGenre = document.querySelector('#book_genre')
  formBookGenre.value = data.genre

  const formBookLanguage = document.querySelector('#book_language')
  formBookLanguage.value = data.language

  const formBookDescription = document.querySelector('#book_description')
  formBookDescription.value = data.description

  const formBookPageCount = document.querySelector('#book_page_count')
  formBookPageCount.value = data.page_count

  const formBookThumbnailUrl = document.querySelector('#book_thumbnail_url')
  formBookThumbnailUrl.value = data.thumbnail_url

  // const formBookGoogleId = document.querySelector('#book_google_id')
  // formBookGoogleId.value = data.google_id

  // const formBookThumbnailImg = document.querySelector('#form-book-thumbnail_img')
  // formBookThumbnailImg.src = data.thumbnail_url

  const formBookIsbn = document.querySelector('#book_isbn')
  formBookIsbn.value = data.isbn // Couldn't be parsed


  // fill Book info HTML show confirmation

  const confirmTitle = document.querySelector('#confirm-book-title')
  confirmTitle.innerHTML = data.title

  const confirmAuthor = document.querySelector('#confirm-book-author')
  confirmAuthor.innerHTML = data.author

  const confirmYear = document.querySelector('#confirm-book-year')
  confirmYear.innerHTML = `${data.year} | ${data.language.toUpperCase()}`

  const formBookThumbnailImg = document.querySelector('#confirm-book-cover')
  formBookThumbnailImg.style.backgroundImage = `url(${data.thumbnail_url})`


  // Removing the Display None Class = make visible
  const bookConfirmationShow = document.querySelector('#book-confirmation-show')
  bookConfirmationShow.classList.remove("d-none")

}




const selectBook = () => {

  // Select Card upon Click + Locate the Parent Div for Dataset + call ExtractData function

  const bookConfirmation = document.querySelector('#book-confirmation');

  const selectBookButtons = document.querySelectorAll('#btn-select'); // ARRAY
  console.log(selectBookButtons)

    selectBookButtons.forEach((button) => {
      button.addEventListener('click', (event) => {
        event.preventDefault() // NOT SURE ABOUT THAT ? AVOID PAGE RELOAD ?
        // Locate the Div with dataset
        document.querySelector('#results').innerHTML = ""
        const parentDiv = event.currentTarget.closest(".book-results-card")
        // Call function with Dataset
        extractData(parentDiv.dataset)
      })
    })
}



const initBooksearch = () => {

  // Search autocomplete : fetch API, populate book cards

  // If this ID is present on the page
  const searchAutoComplete = document.querySelector('#search-autocomplete');

  if (searchAutoComplete) {

    const input = document.querySelector('#search-autocomplete');
    const cards = document.querySelector('#results');
    const bgImage = document.querySelector('#bg-image');

    // TO DO - wait to type 5 x to Start the Autocomplete

    input.addEventListener('keyup', (e) => {
      cards.innerHTML = "";
      bgImage.innerHTML = "";
      const url = `https://www.googleapis.com/books/v1/volumes?q=${input.value}&key=AIzaSyDOUUIk6Yw3a4YdJosG8IY9ikbXDIqo0sc`;
      // search params : intitle: inauthor: isbn: --> ?q=inauthor:${input.value}

      fetch(url)

        .then(response => response.json())// response.json()) ==> then get (data)
        .then((data) => {
          const bookList = data.items // Array of Item results (books)

          // Filtering results with title < XX characters
          const filteredBookList = bookList.filter(book => book.volumeInfo.title.length < 40);

          // TO DO : add more results filters (title include Keyword...)
          // const sortedBooks = filteredBooks.sort((a, b) => a.volumeInfo.title.localeCompare(b.volumeInfo.title))

          // Limit results to 5 Books
          const filteredBooks = filteredBookList.slice(0, 5)


          // Injecting the HTML

          filteredBooks.forEach((book) => {

            var isbn = (book.volumeInfo.industryIdentifiers) ? book.volumeInfo.industryIdentifiers[0].identifier : "Unknown"
            var author = (book.volumeInfo.authors) ? book.volumeInfo.authors[0] : "Unknown author"
            var category = (book.volumeInfo.categories) ? book.volumeInfo.categories[0] : "Unknown category"
            var thumbnail = (book.volumeInfo.imageLinks) ? book.volumeInfo.imageLinks.thumbnail : "https://images-na.ssl-images-amazon.com/images/I/416Q4yh%2BGcL._AC_.jpg"

            cards.insertAdjacentHTML('beforeend',

             `<div class="book-results-card d-flex b-sh my-4"
                data-isbn="${isbn}"
                data-title="${book.volumeInfo.title}"
                data-year="${book.volumeInfo.publishedDate}"
                data-genre="${category}"
                data-author="${author}"
                data-language="${book.volumeInfo.language}"
                data-description="${book.volumeInfo.description}"
                data-page_count="${book.volumeInfo.pageCount}"
                data-thumbnail_url="${thumbnail}"
                data-google_id="${book.id}">


                <div class="image" style="background-image: url(${thumbnail});">
                </div>

                <div class="information p-3">
                  <h2>${book.volumeInfo.title}</h2>
                  <p>${author} (${book.volumeInfo.publishedDate} - ${book.volumeInfo.language.toUpperCase()})</p>
                  <div class="tags d-flex">
                    <a id="btn-select" class="btn genre mr-2" href="#">Select book</a>
                  </div>
                </div>

              </div>`);

          });

        selectBook();

        });
    });
  };
}



export default initBooksearch















