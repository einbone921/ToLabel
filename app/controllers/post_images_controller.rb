class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_image_path(@post_image)
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_image_params
    params.require(:post_image).permit(:post_image, :caption)
  end
end
