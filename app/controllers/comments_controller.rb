class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.create(comment_params.merge(user: current_user))
    if @comment.save
      flash[:success] = "Comment was succesfully added"
      redirect_to place_path(@place)
    else
      if @comment.errors.any?
        errors = ""
        @comment.errors.full_messages.each  do |msg|
          errors+= "#{msg}<br>"
        end
        flash[:danger] = errors
        redirect_to place_path(@place)
      end

    end
  end

  private
  def comment_params
    params.require(:comment).permit(:message, :rating)
  end

end
