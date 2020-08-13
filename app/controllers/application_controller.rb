class ApplicationController < ActionController::API
  def status
    render json: { data: 'ok' }
  end

  def ping
    render json: { data: 'pong' }
  end
end