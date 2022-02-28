import { Controller } from "stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static targets = ["messages"]
  static values = {chatId: Number}

  connect() {

    this.channel = consumer.subscriptions.create(
        {channel: "ChatChannel", id: this.chatIdValue},
        {received: data => this.messagesTarget.insertAdjacentHTML('beforeend', data)} 
    ) 
    console.log(consumer)
  }
}