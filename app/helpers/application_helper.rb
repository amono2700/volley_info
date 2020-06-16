module ApplicationHelper
  def logged_in?
    unless  user_signed_in?
      flash[:alert] = "コメントするにはログインしてください"
      redirect_to new_user_session_url
    end
  end
end
