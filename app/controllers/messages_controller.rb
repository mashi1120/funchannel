class MessagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :new]

  def new
    @message = current_user.messages.build 
  end
  
  
  def show
    @message = current_user.messages.build if logged_in?
    @messages = Message.all.order(created_at: :desc)
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:success] = "Message created!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  private
  def message_params
    params.require(:message).permit(:destination_id, :post_id, :role_name, :content)
  end
end
