import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Messaging Connected Now")
    const input = document.querySelector('#message_content')
    input.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') {
        console.log("working")
      }
    })
  }

  submitOnEnter(event) {
    if (event.key === "Enter") {
      event.preventDefault()
      this.element.submit()
    }
  }

}
