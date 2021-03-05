class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :maps, :update_position ]

  def home
  end

  def maps
    @restaurants = Restaurant.near(session[:user_position], 10)
    @shelters = Shelter.near(session[:user_position], 10)

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

    # @user_markers = [{
    #   lat: session[:user_position][0],
    #   lng: session[:user_position][1],
    #   infoWindow: render_to_string(partial: "info_user", locals: { user: session[:user_position] }),
    #   image_url: helpers.asset_url('png-transparent-computer-icons-map-pin.png') 
    #   }]

    @markers << { lat: session[:user_position][0], lng: session[:user_position][1] }

    @markers += @addresses
  end

  def update_position
    session[:user_position] = [params[:lat], params[:lng]]
  end

  def position_params
    params.permit(:lat, :lng)
  end
end
