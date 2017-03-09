class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index

    @messages = Message.for_display
  end

  def create

    @message = Message.new
    @message = current_user.messages.create(message_params)
    if @message.save
      ActionCable.server.broadcast 'room_channel',
                                       content: @message.content,
                                       username: @message.user.username
                                      # message: render_message(@message)
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






