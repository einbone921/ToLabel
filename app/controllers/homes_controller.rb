class HomesController < ApplicationController
  def top
    @post_images = PostImage.all
  end

  def about
  end
end
