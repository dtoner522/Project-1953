import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('#address-input');
  if (addressInput) {
    places({ container: addressInput });
  }

  const locationInput = document.querySelector('#location-input');
  if (locationInput) {
    places({ container: locationInput });
  }
};

export { initAutocomplete };