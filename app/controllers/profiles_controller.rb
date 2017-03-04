class ProfilesController < ApplicationController
  def show
    @user = User.find_by(username: params[:user_name])


  end
end



