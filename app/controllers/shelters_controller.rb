class SheltersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
    @markers = [{ lat: @shelter.latitude, lng: @shelter.longitude}]
  end
end
