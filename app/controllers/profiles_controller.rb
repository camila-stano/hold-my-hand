class ProfilesController < ApplicationController
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

  def edit
    @profile = current_user
  end

  def update
    create
  end
  
  private

  def user_params
    params.require(:user).permit(:age, :language, :current_address, :gender, :photo, :nickname, :origin,
                                 :about, :arrived, :got_job, :studying_pt, :document)
  end
end
