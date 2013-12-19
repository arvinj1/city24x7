class UserController < ApplicationController
  def create
    ip=remoteIP()
    params[:user][:ip]=ip;
    @user=User.create(params)!

  end
  
  private
  def page_params
    params.require(:user).permit(:ip)
  end
end
