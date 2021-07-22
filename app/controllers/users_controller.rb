class UsersController < ApplicationController

  skip_before_action :only_login_in, only: [:new, :create, :confirm]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(get_params)
    if(@user.valid?)
      @user.save
      RegisterMailer.confirm(@user).deliver_now
      redirect_to new_user_path, success: "Inscription effectuée avec succes. Vous recevrez un mail afin de valider votre inscription"
    else
      render 'new'
    end
  end

  def confirm
    @user = User.find(params[:id])
    if @user.present?
      @user.update_attributes(token: params[:token], validated: true)
      @user.save(validate: false)
      puts "activer"
      redirect_to new_session_path
    else
      render 'confirm'
    end
  end

  def update
    @user = current_user
  end

  private
  def get_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
