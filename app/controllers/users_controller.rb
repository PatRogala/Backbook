class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.where(id: params[:id]).includes(:posts).first
    @friends = Friendship.where(user_id: current_user.id, friend_id: @user.id).any?
  end

  def profile
    @user = current_user
    render :show
  end

  def invite
    @is_invited = FriendsPending.where(inviter_id: current_user.id, invitee_id: params[:id]).any?
    @is_friend = Friendship.where(user_id: current_user.id, friend_id: params[:id]).any?
    @invintable = @is_invited || @is_friend
    FriendsPending.create(inviter_id: current_user.id, invitee_id: params[:id]) unless @invintable
    redirect_to user_path(params[:id])
  end

  def notification
    @friends_requests = current_user.friends_pendings
  end

  def accept
    # Delete from pendings
    friend_pending = current_user.friends_pendings.find_by(inviter_id: params[:id])
    friend_pending.destroy

    # Add to friendlist
    current_user.friendships.create(friend_id: params[:id])
    User.find(params[:id]).friendships.create(friend_id: current_user.id)
    redirect_to :notification
  end

  def decline
    friend_pending = current_user.friends_pendings.find_by(inviter_id: params[:id])
    friend_pending.destroy
    redirect_to :notification
  end
end
