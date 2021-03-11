class DirectsController < ApplicationController
  def index
    @chatrooms = current_user.chatrooms.where(direct: true)
    @message = Message.new
  end

  def create_direct
    raise
    @user = User.find(params[:user_id])
    @chatroom = Chatroom.create!(name: "chat-#{@user.id}-#{current_user.id}", direct: true)
    ChatMember.create(chatroom: @chatroom, user: current_user)
    ChatMember.create(chatroom: @chatroom, user: @user)
    redirect_to @chatroom
  end
end
