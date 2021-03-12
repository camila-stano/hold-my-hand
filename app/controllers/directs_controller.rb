class DirectsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @chatrooms = ChatMember.includes(:chatroom).where(chatrooms: {direct: true}).where(user: current_user) 
    @message = Message.new
  end

  def index
    @chatrooms = ChatMember.includes(:chatroom).where(chatrooms: {direct: true}).where(user: current_user) 
  end

  def create_direct
    @user = User.find(params[:user_id])
    if Chatroom.where( name: ["chat-#{@user.id}-#{current_user.id}","chat-#{current_user.id}-#{@user. id}"]).empty?
      @chatroom = Chatroom.create!(name: "chat-#{@user.id}-#{current_user.id}", direct: true)
      ChatMember.create(chatroom: @chatroom, user: current_user)
      ChatMember.create(chatroom: @chatroom, user: @user)
    else
      @chatroom = Chatroom.where( name: ["chat-#{@user.id}-#{current_user.id}","chat-#{current_user.id}-#{@user. id}"]).first
    end
    redirect_to direct_path(@chatroom)
  end
end
