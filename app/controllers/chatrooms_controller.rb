class ChatroomsController < ApplicationController
  
  def index
    @chatrooms = Chatroom.all
    @last_message = Message.last #ajusta para pegar a última mensagem do site e não a última mensagem de todas
    @chatroom = Chatroom.new
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @chatrooms = Chatroom.all
    @last_message = Message.last #ajusta para pegar a última mensagem do site e não a última mensagem de todas
  end
  
  def create
    @chatroom = Chatroom.new(chatroom_params)

    if @chatroom.save
      redirect_to chatroom_path(@chatroom), notice: 'Group was created!'
    else
      render :index
    end
  end

  def add_member
    @chatroom = Chatroom.find(params[:chatroom_id])
    ChatMember.create(chatroom: @chatroom, user: current_user)
    redirect_to @chatroom
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :photo)
  end
end
