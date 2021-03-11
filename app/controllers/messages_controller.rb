class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      if @chatroom.direct
        ChatroomChannel.broadcast_to(
          @chatroom,
          sender: @message.user.id.to_s,
          message:render_to_string(partial: "direct_message", locals: { message: @message })
        )
      else
        ChatroomChannel.broadcast_to(
          @chatroom,
          sender: @message.user.id.to_s,
          message:render_to_string(partial: "chatroom_message", locals: { message: @message })
        )
      end
      # redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}") #Isso quebra o ajax e faz a página recarregar
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
