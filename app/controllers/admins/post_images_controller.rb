class Admins::PostImagesController < ApplicationController
  def index
    @post_images = PostImage.all.order(created_at: :desc)
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    post_image = PostImage.find(params[:id])
    post_image.update(post_image_params)
    redirect_to "show"
  end

  private

  # def post_image_params
  #   params.require(:post_image).permit()
  # end
end
