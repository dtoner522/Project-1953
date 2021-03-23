const initAutoFilter = () => {
    const form = document.querySelector("form")
    if (form) {
        const languageSelect = document.querySelector("#language-select");
        const genreSelect = document.querySelector("#genre-select");

        console.log(languageSelect)

        $(languageSelect).on('select2:close', (event) => {
            console.log(event.params.data)
          event.preventDefault();
          document.querySelector("form").submit()
        });

        $(genreSelect).on('select2:close', (event) => {
            console.log(event.params.data)
          event.preventDefault();
          document.querySelector("form").submit()
        });
    }
}

export { initAutoFilter };