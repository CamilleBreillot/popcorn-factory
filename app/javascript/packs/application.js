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

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
});

import "controllers"

const panels = document.querySelectorAll(".panel");

function toggleOpen() {
  this.classList.toggle("open");
}

function toggleRemove() {
  this.classList.remove("open");
  this.classList.remove("open-active");
}

function toggleActive(e) {
  if (e.propertyName.includes("flex")) {
    console.log(e.propertyName);
    this.classList.toggle("open-active");
  }
}

panels.forEach(panel => panel.addEventListener('mouseenter', toggleOpen));
panels.forEach(panel => panel.addEventListener('mouseleave', toggleRemove));
panels.forEach(panel => panel.addEventListener('transitionend', toggleActive));
