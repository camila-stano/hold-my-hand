class CommunicationsController < ApplicationController
  def index
    @communications = Communication.all
  end

  def show
    @communication = Communication.find(params[:id])
  end
end
