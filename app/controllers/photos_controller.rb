class PhotosController < ApplicationController
  before_action :authenticate_user!
  def create
    @place = Place.find(params[:place_id])
    @place.photos.create(photo_params.merge(user: current_user))
    redirect_to place_path(@place)


  end

  def destroy
    @place = Place.find(params[:place_id])
    @user = @place.photos.user.username
    if current_user != @user
      return render text: "Not Allowed",
      status: :forbidden
    else
      #need to find id of photo
    end
  end


  private
  def photo_params
    params.require(:photo).permit(:caption, :picture)
  end
end





