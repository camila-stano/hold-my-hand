import { Controller } from "stimulus"

export default class extends Controller {  
  connect() {
      this.get_position();
    }

  get_position() {
    navigator.geolocation.getCurrentPosition((pos) => {
        const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
        let position = pos.coords;

        fetch("/update_position", {
          method: "POST",
          headers: { "X-CSRF-Token": csrfToken, "Content-Type": "application/json" },
          body: JSON.stringify({
              lat: position.latitude,
              lng: position.longitude,
          }),
      });
    });
  }
}