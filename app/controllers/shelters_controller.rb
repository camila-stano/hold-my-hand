class SheltersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :map ]
  
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
    @markers = [{ 
      lat: @shelter.latitude, 
      lng: @shelter.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { shelter: @shelter }) 
      }]
  end

  def map
    @shelter = Shelter.find(params[:shelter_id])
  end
end
