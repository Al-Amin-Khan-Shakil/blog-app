class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def user_sign_out
    sign_out current_user
    redirect_to new_user_session_path notice: 'Signed out successfully.'
  end
end
