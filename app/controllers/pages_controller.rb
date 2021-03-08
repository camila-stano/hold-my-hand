class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :maps, :update_position ]

  def home
  end

  def maps
    @restaurants = session[:user_position] ? Restaurant.near(session[:user_position], 100) : Restaurant.all
    @shelters = session[:user_position] ? Shelter.near(session[:user_position], 100) : Shelter.all

    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
      }
    end

    @addresses = @shelters.geocoded.map do |shelter|
      {
        lat: shelter.latitude,
        lng: shelter.longitude,
        infoWindow: render_to_string(partial: "info", locals: { shelter: shelter })
      }
    end
    
      @umarker = {
      lat: session[:user_position] ? session[:user_position][0] : nil,
      lng: session[:user_position] ? session[:user_position][1] : nil,
      infoWindow: render_to_string(partial: "info_user"),
      image_url: helpers.asset_url('icon_orange.png') 
      }

    # @markers << { lat: session[:user_position][0], lng: session[:user_position][1] }

    @markers += @addresses
    puts '============================='
    p @markers
  end

  def update_position
    
    session[:user_position] = [params[:lat], params[:lng]] 
    
  end

  def position_params
    params.permit(:lat, :lng)
  end
end
