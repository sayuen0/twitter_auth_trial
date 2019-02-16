class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_from_auth(auth)

    session[:user_id] = user.uid
    # メール機能
    NotificationMailer.send_confirm_to_user(user).deliver
    flash[:notice] = "ユーザ認証が完了しました"
    redirect_to root_path
  end

  # root path
  def index
  end

  def destroy
    reset_session
    flash[:notice] ="ログアウトしました"
    redirect_to root_path
  end
end
