import { Controller } from "@hotwired/stimulus";
// Don't forget to import the NPM package
import Typed from "typed.js";

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ['Save all your movie anytime^1000', 'Save all your movie in one place'],
      smartBackspace: true ,// Default value
      typeSpeed: 50
    });
  }
}
