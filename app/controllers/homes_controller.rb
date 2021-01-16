class HomesController < ApplicationController
  def top
    @tags = Tag.all
    @post_images = PostImage.all
  end

  def about
  end

  def new_posts
    @post_images = PostImage.all.order(created_at: :desc)
  end

  # いいね数順に一覧表示
  def popular
    @post_images = PostImage.includes(:favorited_users).sort {|a,b| b.favorited_users.count <=> a.favorited_users.count}
  end
end
