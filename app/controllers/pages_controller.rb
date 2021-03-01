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
      
    @shelter_markers = @shelters.geocoded.map do |shelter|
      {
        lat: shelter.latitude,
        lng: shelter.longitude
      }
    end
  end
end
