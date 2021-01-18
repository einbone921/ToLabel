class Admins::PostImagesController < ApplicationController
  before_action :set_post_image, only: [:show, :edit, :update]

  def index
    @post_images = PostImage.all.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
    @post_image.update(post_image_params)
    redirect_to admins_post_image_path(@post_image)
  end

  private

  def post_image_params
    params.require(:post_image).permit(:is_active)
  end

  # 対象レコードの特定し変数に代入（before_actionで指定のメソッドの実行の際に使用）
  def set_post_image
    @post_image = PostImage.find(params[:id])
  end
end
