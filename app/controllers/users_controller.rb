class UsersController < ApplicationController
  def create
    user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email:params[:email],
      password:params[:password],
      password_confirmation:params[:password_confirmation])
    if user.valid?
      session[:user_id] = user.id
      redirect_to "/groups"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to "/sessions/new"
    end
  end

  def show
  end

end
