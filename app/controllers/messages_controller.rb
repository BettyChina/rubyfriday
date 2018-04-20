class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user_id = session[:id]
    if @message.save
      redirect_to :back
    else
      flash[:errors] = ['Your message could not be created']
      redirect_to :back
    end
  end

  private
    def message_params
      params.require(:message).permit(:content, :event_id)
    end 
end