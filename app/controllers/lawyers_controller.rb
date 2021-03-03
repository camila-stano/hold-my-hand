class LawyersController < ApplicationController
  before_action :set_lawyer, only: [:show]
  skip_before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @lawyers = Lawyer.all
  end

  def show
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


  private

  def set_lawyer
    @lawyer = Lawyer.find(params[:id])
  end

  def lawyer_params
    params.require(:lawyer).parmit(:name, :oab, :address, :phone, :area, :description)
  end
end
