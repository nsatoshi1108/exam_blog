module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def go_to_login
    unless logged_in?
      redirect_to new_session_path
    end
  end
end
