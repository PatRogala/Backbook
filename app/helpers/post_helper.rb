module PostHelper
  def post_date(post)
    post.created_at.to_s.split(' ')[0]
  end

  def post_liked?(post)
    liked = post.likes.where(user_id: current_user.id).any?
    if liked
      "liked"
    end
  end
end
