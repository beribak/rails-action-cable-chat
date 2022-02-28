class ChatChannel < ApplicationCable::Channel
  def subscribed
    # @chat = params[:id]
    stream_from "danko-#{params[:id]}"
  end

  def unsubscribed
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
    # Any cleanup needed when channel is unsubscribed
  end
end
