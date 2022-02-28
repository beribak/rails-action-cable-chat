class MessagesController < ApplicationController

    def create
        @message = Message.new(message_params)
        @chat = Chat.find(params[:chat_id])
        @message.chat = @chat
        @message.user = current_user

        if @message.save
           
            ActionCable.server.broadcast(
                "danko-#{@chat.id}",
                render_to_string(partial: "message", locals: {message: @message})
            )

            # redirect_to chat_path(@chat)
        else
            render 'chats/show'
        end
    end

    private

    def message_params
        params.require(:message).permit(:content)
    end
end
