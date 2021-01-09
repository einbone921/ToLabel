class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_image
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :email, :profile_image)
  end
end