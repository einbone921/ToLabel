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
    @post_image = PostImage.find(params[:id])
  end

  def index
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.new(post_image_params)
    if @post_image.save
      redirect_to post_image_path(@post_image)
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def post_image_params
    params.require(:post_image).permit(:post_image_id, :caption)
  end
end
