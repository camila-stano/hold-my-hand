class ProfilesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "nickname ILIKE :query OR first_name ILIKE :query OR last_name ILIKE :query"
      @profiles = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @profiles = User.all
    end
  end

  def show
    @profile = User.find(params[:id])
  end

  def new
    @profile = current_user
  end
  
  def create
    @profile = User.find(current_user.id)
    if @profile == current_user
      if @profile.update(user_params)
        redirect_to profile_path(@profile)
      else
        render :new
      end
    else
      rendirect_to @profile, alert: "You can just update your own profile"
    end
  end

  private

  def user_params
    params.require(:user).permit(:age, :language, :current_address, :gender, :photo, :nickname, :origin)
  end
end
