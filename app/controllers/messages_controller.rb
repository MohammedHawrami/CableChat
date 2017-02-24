class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.chat_room_id = params[:chat_room_id]
    @message.user_id = current_user.id
    if @message.save!
      redirect_to chat_room_path(params[:chat_room_id])
    else
      Rails.logger.error('Oh no! :(')
      redirect_to chat_room_path(params[:chat_room_id])
    end
  end

  private
    def message_params
      params.require(:message).permit(:body)
    end
end