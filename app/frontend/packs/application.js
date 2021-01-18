// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();

//add bootstrap
import 'bootstrap/dist/js/bootstrap'

//CSS
import '../styles/application'


const images = require.context('../images', true);

//font awesome
import "@fortawesome/fontawesome-free/js/all";