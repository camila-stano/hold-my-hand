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
        lng: restaurant.longitude
      }
    end
  end
end
