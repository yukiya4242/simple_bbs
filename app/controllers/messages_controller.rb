class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.where(sender_id: current_user.id, receiver_id: params[:user_id])
                       .or(Message.where(sender_id: params[:user_id], receiver_id: current_user.id))
                       .order(created_at: :asc)
    @receiver = User.find(params[:user_id])
  end

  def create
    @message = current_user.sent_messages.build(message_params.merge(receiver_id: params[:user_id]))
    if @message.save
      redirect_to user_messages_path(params[:user_id])
    else
      redirect_to user_messages_path(params[:user_id])
    end
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end

end
