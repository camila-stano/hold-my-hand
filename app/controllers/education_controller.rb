class EducationController < ApplicationController
  def index
    @educations = education.all
  end

  def show
    @education = education.find(params[:id])
  end
end
