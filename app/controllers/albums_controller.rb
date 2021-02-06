class AlbumsController < ApplicationController
  before_action :set_album, except: [:new, :create]

  def new
    @album = Album.new
    @album.post_images.build
  end

  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    @album.post_images.each do |post_image|
      post_image.user_id = current_user.id
    end
    @album.save
    @album.post_images.each do |post_image|
      # API側にpost_imageのpost_image_idカラムの値を渡す
      tags = Vision.get_image_data(post_image.post_image_id)
      post_image.save_tags(tags)
    end
    redirect_to album_path(@album)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @album.destroy
    redirect_to user_path(@album.user)
  end

  private

  def album_params
    params.require(:album).permit(:title, :content, post_images_post_images: [])
  end

  def set_album
    @album = Album.find(params[:id])
  end

end
