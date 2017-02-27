class CommentToPhotosController < ApplicationController
  before_action :authenticate_user!
  def create
    @place = Place.find_by_id(params[:place_id])

    #@place.photos.comment_to_photos.create(comment_to_photo_params.merge(user: current_user).merge(photo: @place.photos.id))
    @comment = @place.ph
    redirect_to root_path
  end

  private
  def comment_to_photo_params
    params.require(:comment_to_photos).permit(:photo_comment)
  end

end
