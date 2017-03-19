class MessagesController < ApplicationController
  include ActionView::Helpers::DateHelper
  before_action :authenticate_user!
  def index
    @message  = current_user.messages.build
    @messages = Message.for_display
  end

  def create


    @message = current_user.messages.build(message_params)
    if @message.save
      ActionCable.server.broadcast 'room_channel',
                                       content: @message.content,
                                       username: @message.user.username,
                                       time: time_ago_in_words(@message.created_at)
                                      # message: render_message(@message)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    # if current_user != @message.user
    #   return render text: 'Not Allowed', status: :forbidden

    # else
    #   @message.destroy
    #   ActionCable.server.broadcast 'room_channel',
    #                                    content: @message.content,
    #                                    username: @message.user.username,
    #                                    time: time_ago_in_words(@message.created_at)
    #   # flash[:success] = "Message was removed"
    #   # redirect_to root_path

    # end

     if current_user == @message.user
      @message.destroy
      respond_to do |format|
        #flash[:info] = "Comment Deleted"
        format.html{redirect_to(:back)}
        format.js
      end
    else
      flash[:warning] = "You are not authorized to do that"
      redirect_to root_paths


      end
  end



  private
    def message_params
        params.require(:message).permit(:content)
    end

    # def render_message(message)
    #   render(partial: '/messages/message', locals: { message: message })
    # end
end






