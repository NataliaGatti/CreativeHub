// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initflatpickr } from "../plugins/init_flatpickr";
import { initSweetalert } from '../plugins/init_sweetalert';
import { initSelect2 } from '../plugins/init_select2';
// import "../plugins/init_flatpickr";

// Internal imports, e.g:


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
   initflatpickr();
  initSelect2();
   initSweetalert('#sweet-alert-demo', {
     title: "Te has postulado para este proyecto!",
     text: "En el transcurso de las proximas 72hs la empresa revisara tu propuesta y recibirás un correo electrónico si tu proyecto fue aceptado!",
     icon: "success"
   },
     (value) => {
       if (value) {
         const link = document.querySelector('.btn-primary');
         link.click();
       }
     });
});


