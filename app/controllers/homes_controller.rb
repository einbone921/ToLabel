class HomesController < ApplicationController
  before_action :top

  def top
    @tags = Tag.all
    if @q = PostImage.ransack(params[:q])
      @post_images = @q.result
    else
      @post_images = PostImage.all
    end
  end

  def about
  end

end
