module ApplicationHelper
  def email_is_visible?(user)
    user_signed_in? && user.email_privacy == 1 || user.email_privacy == 2 || user_signed_in? && current_user?(user)
  end

  def current_user?(user)
    user == current_user
  end
  
  def im_details_visible?(user)
    user.im_privacy == true || user_signed_in? && user.im_privacy == false
  end
end
