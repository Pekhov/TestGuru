class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:path] || root_path
    else
      flash.now[:alert] = 'Verify your Email and Password'
      render :new
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path
  end
end
