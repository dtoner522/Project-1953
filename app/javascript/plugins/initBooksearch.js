

const initBooksearch = () => {

  const searchAutoComplete = document.querySelector('#search-autocomplete');

  if (searchAutoComplete) {

    const input = document.querySelector('#search-autocomplete');
    const cards = document.querySelector('#results');

    input.addEventListener('keyup', () => {
      cards.innerHTML = "";
      const url = `https://www.googleapis.com/books/v1/volumes?q=intitle:${input.value}`;
      fetch(url)

        .then(response => response.json())// response.json()) ==> then get (data)
        .then((data) => {
          // console.log(data.words); // data.words => ["bar", "barc", "barcelona"]
          const bookList = data.items
          const filteredBooks = bookList.filter(listItem => listItem.volumeInfo.title.length < 40);
          const sortedBooks = filteredBooks.sort((a, b) => a.volumeInfo.title.localeCompare(b.volumeInfo.title))
          filteredBooks.forEach((result) => {
            cards.insertAdjacentHTML('beforeend', `<li>${result.volumeInfo.title} - ${result.volumeInfo.publishedDate}</li>`);
          });
        });
    });
  }
}

export default initBooksearch




