import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'user' ]  
  connect() {
      this.getPosition();
    }
  
  getPosition() {
    // load() {
      navigator.geolocation.getCurrentPosition((pos) => {
        const position = pos.coords;
        const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
        
        
        fetch('/update_position', {
          method: "POST",
          headers: { 'X-CSRF-Token': csrfToken }, 
          body: JSON.stringify({
            lat: position.latitude,
            lng: position.longitude
          })
        })
      }, () => {
        console.log("Position unavailable.")
      })
    // }
  }
}
