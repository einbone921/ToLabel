class Admins::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @post_images = @user.post_images
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to admins_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:delete_flag)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
