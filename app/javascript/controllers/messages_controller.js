import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages"
export default class extends Controller {
  static targets = [ "items", "form" ]
  connect() {
    this.csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
  }

  send(event) {
    event.preventDefault()
    const url = this.formTarget.action
    const options = {
      method: "POST",
      headers: { Accept: "application/json", "X-CSRF-Token": this.csrfToken },
      body: new FormData(this.formTarget)
    }
    fetch(url, options)
      .then(response => response.json())
      .then(data => {
        if (data.my_message) {
          this.itemsTarget.insertAdjacentHTML("beforeend", data.my_message)
        }
        this.formTarget.outerHTML = data.my_form
      })
  }
}
