class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  # ログイン後にログインユーザーのページへ遷移
  def after_sign_in_path_for(resource)
    # user_path(resource)
    root_path
  end

  # 検索フォームの全画面対応
  def set_search
    @q = PostImage.ransack(params[:q])
    @post_images = @q.result
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
  end
end
