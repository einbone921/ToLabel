class HomesController < ApplicationController
  before_action :top

  def top
    @tags = Tag.all
    # ワード検索の場合
    if @q = PostImage.ransack(params[:q])
      @post_images = @q.result
    else
      @post_images = PostImage.all
    end
  end

  def about
  end
end
