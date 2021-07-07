module UsersHelper
  def user_sex_icon(user)
    user.sex == "M" ? "<i class=\"fas fa-mars\"></i>" : "<i class=\"fas fa-venus\"></i>"
  end

  def user_creation_time(user)
    user.created_at.to_s.split(" ")[0]
  end
end
