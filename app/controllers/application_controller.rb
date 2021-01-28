class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def after_sign_in_path_for(resource)
    if user_signed_in?
      root_path
    else
      admins_post_images_path
    end
  end

  def set_search
    @q = PostImage.ransack(params[:q])
    @post_images = @q.result
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
  end
end
