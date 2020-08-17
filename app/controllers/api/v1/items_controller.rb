class Api::V1::ItemsController < ApplicationController
  before_filter :set_current_user
  before_action :find_item, only: [:show,:update,:edit]
  def new
    if User.find_by_session_token(session[:session_token]).admin?
      render json: {message: 'Welcome to the session, please add any items.'}, status: 200
    else
      render json: {error: 'Not admin'}, status: 400
    end
  end

  def create
    User.find_by_session_token(session[:session_token]).cart.items.create!(item_params)
  end

  def show
    render json: @item
  end

  def edit
    if session[:session_token].blank?
      render json: {error: 'You must be signed in to edit an item'}, status: 400
    end
    unless User.find_by_session_token(session[:session_token]).admin?
      render json: {error: 'You must be an admin to edit an item'}, status: 400
    end
    end

  def update
    if session[:session_token].blank?
      render json: {error: 'You must be signed in to edit an item'}, status: 400
    end
    unless User.find_by_session_token(session[:session_token]).admin?
      render json: {error: 'You must be an admin to edit an item'}, status: 400
    end
    @item.update_attributes!(item_params)
    render json: {message: 'Item was updated successfully'}, status: 200
  end

  def index
    if params[:item].nil?
      @items =[]
      Item.all.each do |item|
        #name =
      end
    end
  end
  private

  def item_params
    params.require(:item).permit(:description)
  end

  def find_item
  id = params[:id]
  @item =Item.find(id)
  end
end
