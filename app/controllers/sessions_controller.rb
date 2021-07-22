class SessionsController < ApplicationController
  skip_before_action :only_login_in, only: [:new, :create]
  def new
    
  end

  def create
    user_params = params.require(:user)
    @user = User.where(username: user_params[:username] ).or(User.where(email: user_params[:email])).first
    if @user && @user.authenticate(user_params[:password])
      session[:auth] = @user.to_session
      redirect_to profil_path
    else
      flash.now[:danger] = "Identifient ou mot de passe incorrecte"
      render 'new'
    end
  end

  def destroy
    session.destroy
    redirect_to new_session_path, success: "Deconnecter avec succes"
  end

end
