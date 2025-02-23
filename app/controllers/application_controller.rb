class ApplicationController < ActionController::API
  def authenticate_user!
    unless current_user
      render json: { error: "Not authorized" }, status: :unauthorized
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
