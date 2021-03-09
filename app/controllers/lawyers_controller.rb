class LawyersController < ApplicationController
  before_action :set_lawyer, only: [:show, :rating]
  skip_before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @lawyers = Lawyer.all
  end

  def show
    @review = Review.new
    @markers = [{ 
      lat: @lawyer.latitude,
      lng: @lawyer.longitude,
      }]
    rating
  end

  def new
    @lawyer = Lawyer.new
  end

  def create
    @lawyer = Lawyer.new(lawyer_params)

    if @lawyer.save
      redirect_to root_path, notice: 'your data, are under analysis. We will contact you soon'
    else
      render :new
    end
  end

  def rating
    if @lawyer.reviews.present?
      ratings = 0
      @lawyer.reviews.each do |review|
        next if review.rating.nil? 
        ratings += review.rating 
      end

      if @lawyer.reviews.count != 0 && @lawyer.reviews.count != nil 
        @total_rating = (ratings / @lawyer.reviews.count)
      end
    end
  end

  private

  def set_lawyer
    @lawyer = Lawyer.find(params[:id])
  end

  def lawyer_params
    params.require(:lawyer).parmit(:name, :oab, :address, :phone, :area, :description)
  end
end
