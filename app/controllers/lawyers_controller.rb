class LawyersController < ApplicationController
  def index
    @lawyers = Lawyer.all
  end

  def show
    @lawyer = Lawyer.find(params[:id])
  end
end
