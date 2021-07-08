module UsersHelper
  def user_sex_icon(user)
    user.sex == "M" ? "<i class=\"fas fa-mars\"></i>" : "<i class=\"fas fa-venus\"></i>"
  end

  def user_creation_time(user)
    user.created_at.to_s.split(" ")[0]
  end

  def invitation_status(current_user_id, param_id)
    puts current_user_id
    puts param_id
    puts FriendsPending.where(inviter_id: current_user_id, invitee_id: param_id).any?
    FriendsPending.where(inviter_id: current_user_id, invitee_id: param_id).any? ? "Already sent" : "Add Friend"
  end
end
