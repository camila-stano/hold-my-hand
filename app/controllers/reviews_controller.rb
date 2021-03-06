class ReviewsController < ApplicationController
  before_action :set_lawyer

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.lawyer = @lawyer

    if @review.save
      redirect_to lawyer_path(@lawyer)
    else
      render :new
    end
  end

  private
  
  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :lawyer_id)
  end

  def set_lawyer
    @lawyer = Lawyer.find(params[:lawyer_id])
  end
end
