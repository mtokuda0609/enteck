module SessionsHelper
  #binding.pry
  def current_user
    @current_user ||= Company.find_by(id: session[:company_id])
  end
  
  def logged_in?
    !!current_user
  end
end
