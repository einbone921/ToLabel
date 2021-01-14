class HomesController < ApplicationController
  def top
    @post_images = PostImage.all
    @tags = Tag.all
  end

  def about
  end
end
