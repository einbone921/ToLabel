class UsersController < ApplicationController
  # before_action :check_guest, only: :hide
  before_action :set_user

  def show
    @post_images = @user.post_images
  end

  def edit
    if @user != current_user
      redirect_to root_path
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  def follows
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  def hide
    @user.update(delete_flag: true)
    reset_session
    flash.now[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  # def check_guest
  #   if resource.email == 'guest@example.com'
  #     redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :email, :profile_image)
  end

  # 対象レコードの特定し変数に代入（before_actionで指定のメソッドの実行の際に使用）
  def set_user
    @user = User.find(params[:id])
  end
end
