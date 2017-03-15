class ProfilesController < ApplicationController
  def show

    @places = User.find_by(username: params[:username]).places.order("created_at DESC")
    @photos = User.find_by(username: params[:username]).photos.order("created_at DESC")
    @user = User.find_by(username: params[:username])
  end

  def edit
    @user = User.find_by(user_name: params[:username])
  end
end





