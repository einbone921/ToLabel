class HomesController < ApplicationController
  before_action :top

  def top
    @tags = Tag.all
    @post_images = PostImage.all
  end

  def about
  end


  def new_posts
    @post_images = PostImage.all.order(created_at: :desc)
  end

end
