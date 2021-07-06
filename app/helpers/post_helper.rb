module PostHelper
  def post_date(post)
    post.created_at.to_s.split(' ')[0]
  end
end
