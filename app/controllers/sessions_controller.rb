class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:email] == ""
      if flash[:errors] == nil
        flash[:errors] = ["Email can't be blank"]
      else
        flash[:errors].push("Email can't be blank")
      end
    end
    if params[:password] == ""
      if flash[:errors] == nil
        flash[:errors] = ["Password can't be blank"]
      else
        flash[:errors].push("Password can't be blank")
      end
    end
    if flash[:errors] == nil
      user = User.find_by_email(params[:email])
      if user
        if user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to "/groups"
        else
          flash[:errors] = ["email and password do not match"]
          redirect_to '/sessions/new'
        end
      else
        flash[:errors] = ["Unable to find email"]
        redirect_to '/sessions/new'
      end
    else
      redirect_to '/sessions/new'
    end
  end

  def delete
    session.clear
    redirect_to '/sessions/new'
  end

end
