class CommentToPhotosController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @photo = Photo.find(params[:photo_id])
    @photo.comment_to_photos.create(comment_to_photo_params.merge(user_id:current_user.id, place_id: @photo.place.id))
    if @photo.save
      respond_to do |format|
        format.html {redirect_to(:back)}
        format.js
      end
      # flash[:success] = "Added Your comment"
      # redirect_to(:back)#place_path(@photo.place.id)
    else
      flash[:danger] = "Check the comment form, something went
wrong."
      redirect_to root_path
    end
  end


  def destroy
    #@photo = Photo.find(params[:photo_id])
    #@comment = @photo.comment_to_photos.find(params[:id])
    @comment = CommentToPhoto.find(params[:id])

    @comment.destroy
    flash[:info] = "Comment Deleted"
    redirect_to(:back)
  end

  private
  def comment_to_photo_params
    params.require(:comment_to_photo).permit(:photo_comment)
  end

end
