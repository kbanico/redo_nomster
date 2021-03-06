class ProfilesController < ApplicationController

  before_action :owned_profile, only: [:edit, :update]
  before_action :authenticate_user!

  before_action :set_user


  def show

    @places = User.find_by(username: params[:username]).places.order("created_at DESC")
    @photos = User.find_by(username: params[:username]).photos.order("created_at DESC")
  end

  def edit

  end

  def update

    if @user.update(profile_params)
      flash[:success] = "Your profile has been updated"
      redirect_to profile_path(@user.username)
    else
      @user.errors.full_messages
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end

  def owned_profile
    @user = User.find_by(username: params[:username])
    unless current_user == @user
      flash[:alert] = "That profile doesn't belong to you!"
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find_by(username: params[:username])
  end
end





