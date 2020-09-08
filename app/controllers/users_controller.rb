class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      mail = UserMailer.with(user: @user).welcome.deliver_now

      mail.deliver_now
      redirect_to user_path(@user, notice: 'User was successfully created.')
    else
      render :new
  end



    # respond_to do |format|
    #   if @user.save
    #     # Tell the UserMailer to send a welcome email after save
    #     UserMailer.with(user: @user).welcome_email.deliver_later

    #     format.html { redirect_to(@user, notice: 'User was successfully created.') }
    #     format.json { render json: @user, status: :created, location: @user }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end

  def destroy
  end

  def edit
  end

  def update
  end
end
