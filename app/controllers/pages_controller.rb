class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :flowers, :about, :new_feedback, :create_feedback ]

  def home
  end

  def about
  end

  def flowers
  end

  def new_feedback
  end

  def create_feedback
  end


  def contact

  end
end

