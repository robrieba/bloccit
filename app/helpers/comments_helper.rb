module CommentsHelper
  def user_is_authorized_for_comment?(comment)
     current_user && (current_user == comment.user || current_user.admin?)
  end

  def user_is_authorized_to_add_comment?
     if current_user
       true
     end
  end

end
