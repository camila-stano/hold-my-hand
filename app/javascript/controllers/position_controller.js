import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'user' ]  
  connect() {
      console.log('hello');
    }
  }