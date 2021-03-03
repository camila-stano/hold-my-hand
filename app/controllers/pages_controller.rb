class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :maps ]

  def home
  end

  def maps
    @restaurants = Restaurant.all
    @shelters = Shelter.all



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

    @markers += @addresses
  end
end
