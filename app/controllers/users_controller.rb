class UsersController < ApplicationController
  def create
    ip=remoteIP()
    params[:user][:ip]=ip;
    @user=User.create(params)

  end
  
  def index
    @users=User.all
  end
  
  private
  def page_params
    params.require(:user).permit(:ip)
  end
end
