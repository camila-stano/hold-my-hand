class ReviewsController < ApplicationController
  before_action :set_lawyer

  def index
    @reviews = Review.where(lawyer: @lawyer)
    rating
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.lawyer = @lawyer
    @review.user = current_user

    if @review.save
      redirect_to lawyer_path(@lawyer)
    else
      render :new
    end
  end

  def rating
    @reviews = Review.where(lawyer: @lawyer)
    ratings = 0 
    @reviews.each do |review|
      rating = review.rating
      ratings += rating 
    end

    @total_rating = (ratings / @reviews.count).to_f
  end

  private
  
  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :lawyer_id)
  end

  def set_lawyer
    @lawyer = Lawyer.find(params[:lawyer_id])
  end
end
