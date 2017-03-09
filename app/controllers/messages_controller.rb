class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @messages = Message.all
  end

  def create

    @message = Message.new
    @message = current_user.messages.create(message_params)
    if @message.save
      redirect_to messages_path
    end
  end

  private
    def message_params
        params.require(:message).permit(:content)
    end
end
