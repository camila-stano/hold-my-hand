class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
  
  def index
    @chatrooms = Chatroom.all
    @last_message = Message.last
  end

  def new
    @chatroom = Chatroom.new
  end

end
