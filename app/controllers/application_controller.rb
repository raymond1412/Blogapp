class ApplicationController < ActionController::Base

   protect_from_forgery with: :exception

   helper_method :current_user
  
  private
  
  def current_user
  	return unless session[:current_user_id].present?
    @current_user ||= User.find_by(id: session[:current_user_id])
  end 

end
