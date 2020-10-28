class RelationshipsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @followers = @user.followers
    @following = @user.following
  end
  # If you are using Devise, use the following instead of if logged_in?
  # before_action :authenticate_undefined!
  respond_to? :js # If you want to return all the responses to existing actions in js, you can use this description.
  def create
    #  If it's a self-created login feature, you should have implemented your own
    # Use the logged_in? method to make it possible to follow only when logged in.
    if user_signed_in?
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
    end
    #FollowMailer.follow_mail(@user).deliver
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
end
end
