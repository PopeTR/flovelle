class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
    @user = User.find(current_user.id)
    @user.update(account_params)
    redirect_to accounts_path(@user)
  end

  private

  def account_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :phone_number, :zipcode)
  end
end
