class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(session_params[:username], session_params[:password])

    if user && user.save
      login(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Invalid login credentials."]
      render :new
    end
  end

  def destroy
    current_user.reset_session_token
    session[:session_token] = nil
    redirect_to goals_url
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
