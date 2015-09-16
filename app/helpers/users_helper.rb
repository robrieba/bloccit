module UsersHelper

  def render_user_posts(user)
    if user.posts.count > 0
      render user.posts
    else
      "#{user.name} has not submitted any posts yet."
    end
  end

  def render_user_comments(user)
    if user.comments.count > 0
      render user.comments
    else
      "#{user.name} has not submitted any comments yet."
    end
  end

end
