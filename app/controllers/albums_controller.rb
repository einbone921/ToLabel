class AlbumsController < ApplicationController

  def new
    @album = Album.new
    @album.post_images.build
  end

  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    @album.save
    redirect_to album_path(@album)
  end

  def show
    @album = Album.find(params[:id])
  end

  private

  def album_params
    params.require(:album).permit(:title, :content, post_images_post_images: [])
  end

end
