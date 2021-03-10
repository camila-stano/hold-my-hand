class DirectsController < ApplicationController
  def show
    @direct = Chatroom.find(params[:id])
    @directs = Chatroom.all
    @last_direct = Message.last
    @message = Message.new
  end
end
