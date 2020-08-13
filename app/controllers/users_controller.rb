class UsersController < ApplicationController
  before_filter :set_current_user

  def user_params
    params.require(:user).permit(:user_id, :email, :session_token, :first_name, :last_name, :password, :password_confirmation)
  end

  def new
    # default: render 'new' template
  end

  def create
    if User.exists?(user_id: params[:user][:user_id]) || User.exists?(email: params[:user][:email])
      # flash[:notice] = 'Sorry, this user-id or email is taken. Try again.'
      # if user exists need to return response to front end
      nil
    end

    @user = if params[:user][:is_admin?]
              # create admin (something like Admin.new(user_params))
            else
              # create regular user (something like Regular.new(user_params))
            end

    if !@user.nil? && @user.save
    # account creation is successful need to return response to server to redirect to a login page
    else
        # They didn't give a valid password need to display error message and either redirect to login page or highlight whats wrong
      end
  end
end