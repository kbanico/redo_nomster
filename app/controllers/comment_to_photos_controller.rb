class CommentToPhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :find_photo

  def index
    respond_to do |format|
      format.js do
        @page = params[:page].to_i
      end
    end
  end

  def create
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
    if @comment.user_id == current_user.id
      @comment.destroy
      respond_to do |format|
        #flash[:info] = "Comment Deleted"
        format.html{redirect_to(:back)}
        format.js
      end

      end
  end

  private

  def find_photo
    @photo = Photo.find(params[:photo_id])
  end

  def comment_to_photo_params
    params.require(:comment_to_photo).permit(:photo_comment)
  end

end
