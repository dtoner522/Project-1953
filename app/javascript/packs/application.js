 // This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import initBooksearch from '../plugins/initBooksearch'
import initProfileMenu from '../plugins/initProfileMenu'
import { initChatroomCable } from '../channels/chatroom_channel'

import { initAutocomplete } from '../plugins/init_autocomplete'
import { initSelect2 } from '../plugins/init_select2';
import { initAutoFilter } from '../plugins/init_autofilter';
import { previewImageOnFileSelect } from '../plugins/photo_preview';


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initProfileMenu();
  initBooksearch();
  initChatroomCable();
  initSelect2();
  initAutoFilter();
  initAutocomplete()
  previewImageOnFileSelect();
});

$(".alert").delay(4000).slideUp(200, function() {
  $(this).alert('close');
});