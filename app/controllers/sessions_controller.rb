class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    #request.env['omniauth.auth']に、OmniAuthによってHash化されたユーザーデータが格納されている。
    if user
      log_in user #Sessionsヘルパーのlog_inメソッド
      remember user #記憶トークンをDBに保存
      redirect_to root_path
    else
      flash.now[:danger] = 'ログインできませんでした'
      redirect_to root_path
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
