class UsersController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = current_user
    render :show
  end

  def invite
    @is_invited = FriendsPending.where(inviter_id: current_user, invitee_id: params[:id]).any?
    puts @is_invited
    FriendsPending.create(inviter_id: current_user, invitee_id: params[:id]) unless @is_invited
  end

  def notification
    @friends_requests = FriendsPending.where(invitee_id: current_user)
  end
end
