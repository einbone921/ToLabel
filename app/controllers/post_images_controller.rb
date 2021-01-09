class PostImagesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_image_path(@post_image)
    else
      render "new"
    end
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def index
  end

  def edit
    @post_image = PostImage.find(params[:id])
    if @post_image.user != current_user #ログインユーザがURLより他のユーザーの投稿編集画面に遷移した際に実行
      redirect_to root_path
    end
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      redirect_to post_image_path(@post_image)
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def post_image_params
    params.require(:post_image).permit(:post_image, :caption)
  end
end
