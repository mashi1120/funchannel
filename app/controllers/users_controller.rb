class UsersController < ApplicationController
  
  def show 
   @user = User.find(params[:id])
   @message = @user.messages.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "funchannnelにご登録いただきありがとうございます!"
      redirect_to @user 
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end