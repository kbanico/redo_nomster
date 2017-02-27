class PhotosController < ApplicationController
  before_action :authenticate_user!
  def create
    @place = Place.find(params[:place_id])
    @place.photos.create(photo_params.merge(user: current_user))
    redirect_to place_path(@place)


  end

  def destroy
    @photo = Photo.find(params[:id])

    if current_user != @photo.user
      return render text: "Not Allowed",
      status: :forbidden
    else
      @photo.destroy
      redirect_to root_path
    end
  end


  private
  def photo_params
    params.require(:photo).permit(:caption, :picture)
  end
end





