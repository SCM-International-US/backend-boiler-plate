class Api::V1::ItemsController < ApplicationController
  def new
    if User.find_by_session_token(session[:session_token]).admin?
      render json: {message: 'Welcome to the session, please add any items.'}, status: 200
    else
      render json: {error: 'Not admin'}, status: 400
    end
  end

  def create
    User.find_by_session_token(session[:session_token]).
  end
end
