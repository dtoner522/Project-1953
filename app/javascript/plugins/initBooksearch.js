

const selectBook = () => {

  const selectBookButtons = document.querySelectorAll('#btn-select'); // ARRAY
  console.log(selectBookButtons)

    selectBookButtons.forEach((button) => {
      button.addEventListener('click', (event) => {
        console.log("hello");
        event.currentTarget // DO .dataset
      })
    })
}




const initBooksearch = () => {

  const searchAutoComplete = document.querySelector('#search-autocomplete');

  if (searchAutoComplete) {

    const input = document.querySelector('#search-autocomplete');
    const cards = document.querySelector('#results');

    // TO DO - wait to type 5 x to Start the Autocomplete

    input.addEventListener('keyup', () => {
      cards.innerHTML = "";
      const url = `https://www.googleapis.com/books/v1/volumes?q=intitle:${input.value}`;
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

            var author = (book.volumeInfo.authors) ? book.volumeInfo.authors[0] : "Unknown author"
            var category = (book.volumeInfo.categories) ? book.volumeInfo.categories[0] : "Unknown category"
            var thumbnail = (book.volumeInfo.imageLinks) ? book.volumeInfo.imageLinks.thumbnail : "https://images-na.ssl-images-amazon.com/images/I/416Q4yh%2BGcL._AC_.jpg"

            cards.insertAdjacentHTML('beforeend',

             `<div
                  data-isbn="${book.volumeInfo.industryIdentifiers}"
                  data-title="${book.volumeInfo.title}"
                  data-year="${book.volumeInfo.publishedDate}"
                  data-genre="${category}"
                  data-author="${author}"
                  data-language="${book.volumeInfo.language}"
                  data-description="${book.volumeInfo.description}"
                  data-page_count="${book.volumeInfo.pageCount}"
                  data-thumbnail_url="${thumbnail}"
                  data-google_id="${book.id}"

                  class="book-results-card d-flex b-sh my-4"
              >
                  <div class="image" style="background-image: url(${thumbnail});">
                  </div>
                  <div class="information p-3">
                    <h2>${book.volumeInfo.title}</h2>
                    <p>Nora Barret (${book.volumeInfo.publishedDate})</p>
                    <div class="tags d-flex">
                      <a id="btn-select" class="btn genre mr-2" href="#">Select book</a>
                    </div>
                  </div>

             </div>`);

          });
        selectBook();
        });
    });
  }
}

export default initBooksearch















