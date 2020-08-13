class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def set_current_user
    @current_user ||= session[:session_token] && User.find_by_session_token(session[:session_token])
  end

  def status
    render json: { data: 'ok' }
  end

  def ping
    render json: { data: 'pong' }
  end
end