class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :maps ]

  def home
  end

  def maps
  end
end
