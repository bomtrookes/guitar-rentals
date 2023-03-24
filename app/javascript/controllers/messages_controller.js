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
        console.log(data)
      })
  }

  // loadMessages() {
  //   const chatroomId = this.element.dataset.chatroomId;
  //   fetch(`/chatrooms/${chatroomId}/messages`)
  //     .then(response => response.json())
  //     .then(data => {
  //       this.renderMessages(data);
  //       setTimeout(() => {
  //         this.loadMessages();
  //       }, 1000); // Poll every 1 second
  //     });
  // }

  // renderMessages(messages) {
  //   this.messagesTarget.innerHTML = ""; // Clear previous messages
  //   messages.forEach(message => {
  //     const html = `<div class="message">
  //       <span class="author">${message.author}</span>
  //       <span class="body">${message.body}</span>
  //     </div>`;
  //     this.messagesTarget.insertAdjacentHTML("beforeend", html);
  //   });
  // }
}
