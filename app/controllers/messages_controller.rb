class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        if @chatroom.direct
          render_to_string(partial: "javascript_message_to_send", locals: { message: @message })
        else
          render_to_string(partial: "chatroom_message", locals: { message: @message })
        end
      )
      # redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}") #Isso quebra o ajax e faz a página recarregar
    else
      render "chatrooms/show"
    end
      redirect_to direct_path(@chatroom)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
