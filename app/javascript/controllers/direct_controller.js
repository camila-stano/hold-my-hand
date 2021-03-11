import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['direct', 'containerDirect']
  static values = {chat: Number}
  connect() {
      console.log('connected')
  }
  show() {
    console.log(this.chatValue)
}
}