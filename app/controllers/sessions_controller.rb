class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_from_auth(auth)

    session[:user_id] = user.uid
    flash[:notice] = "ユーザ認証が完了しました"
    if auth.provider=="github"
    end
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
