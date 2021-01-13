class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @users = @user.followings
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    # redirect_to request.referer
  end

  def destroy
    @user = User.find(params[:user_id])
    @users = @user.followers
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    # redirect_to request.referer
  end
end
