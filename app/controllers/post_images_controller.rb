class PostImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post_image = PostImage.new
    @tag = Tag.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    # splitの指定を下記に指定することで、全角半角どちらでも空白での分割が可能
    tag_list = params[:post_image][:tag_names].split(/[[:blank:]]/)
    if @post_image.save
      @post_image.save_tags(tag_list)
      redirect_to post_image_path(@post_image)
    else
      render "new"
    end
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def index
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @post_images = @tag.post_images
    else
      @post_images = PostImage.all.order(created_at: :desc)
    end
  end

  def edit
    @post_image = PostImage.find(params[:id])
    @tag_list = @post_image.tags.pluck(:tag_name).join(" ") # @post_imageに結びついたタグを取得し、空白区切りで表示
    if @post_image.user != current_user # ログインユーザがURLより他のユーザーの投稿編集画面に遷移した際に実行
      redirect_to root_path
    end
  end

  def update
    @post_image = PostImage.find(params[:id])
    tag_list = params[:post_image][:tag_names].split(/[[:blank:]]/)
    if @post_image.update(post_image_params)
      @post_image.save_tags(tag_list)
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

  def tag_params
    params.require(:post_image).permit(:tag_names)
  end
end
