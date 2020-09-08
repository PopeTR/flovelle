class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :flowers, :about, :new_feedback, :create_feedback ]

  def home
    unless session[:modal_shown]
      @show_modal = true
      session[:modal_shown] = true
    else
      @show_modal = false
    end
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

