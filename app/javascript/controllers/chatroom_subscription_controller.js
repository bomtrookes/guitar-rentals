import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    const consumer = createConsumer();
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: (data) => this.#insertMessageAndScrollDown(data) }
    );

    // const form = document.querySelector('#new_message')
    // const input = document.querySelector('#message_content')
    // input.addEventListener('keydown', (e) => {
    //   if (e.key === 'Enter') {
    //     e.preventDefault();
    //     const messageContent = input.value.trim();
    //     if (messageContent !== '') {
    //       this.channel.send({ message: messageContent });
    //       input.value = '';
    //     }
    //   }
    // });


    console.log(
      `Subscribe to the chatroom with the id ${this.chatroomIdValue}.`
    );
  }

  resetForm(event) {
    event.target.reset();
  }

  #insertMessageAndScrollDown(data) {
    let newData = "";
    if (data.includes(`<strong>${this.userNameValue}</strong>`)) {
      newData = data;
    } else {
      newData = data.replace("current-user-message", "other-user-message");
    }
    this.messagesTarget.insertAdjacentHTML("beforeend", newData);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom");
    this.channel.unsubscribe();
  }
}
