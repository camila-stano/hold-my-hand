class ReviewsController < ApplicationController
  before_action :set_lawyer, only: [:index, :new,:create, :rating]
  before_action :set_review, only: [:edit, :update, :destroy]

  def index
    @reviews = Review.where(lawyer: @lawyer)
    rating
    render layout: "nofooter"
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.lawyer = @lawyer
    @review.user = current_user

    if @review.save
      redirect_to lawyer_path(@lawyer), notice: 'Thank you for your review!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if current_user == @review.user
      @review.update(review_params)
      if @review.save
        redirect_to lawyer_reviews_path(@review.lawyer_id)
      else
        render :edit
      end
    else
      redirect_to lawyer_reviews_path(@review.lawyer_id), alert: "You can't edit this review"
    end
  end

  def destroy
    if current_user == @review.user
      @review.destroy
      redirect_to lawyer_reviews_path(@review.lawyer_id)
    else
      redirect_to lawyer_reviews_path(@review.lawyer_id), alert: "You can't edit this review"
    end
  end 

  def rating
    @reviews = Review.where(lawyer: @lawyer)
    ratings = 0 
    @reviews.each do |review|
      rating = review.rating
      ratings += rating 
    end


    if @reviews.count != 0 && @reviews.count != nil 
      @total_rating = (ratings / @reviews.count)
    end 
    
  end

  private
  
  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :lawyer_id)
  end

  def set_lawyer
    @lawyer = Lawyer.find(params[:lawyer_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
