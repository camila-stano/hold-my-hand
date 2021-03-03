class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @markers = { lat: @restaurant.latitude, lng: @restaurant.longitude}
  end
end
