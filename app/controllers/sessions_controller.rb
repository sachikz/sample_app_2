class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    #request.env['omniauth.auth']に、OmniAuthによってHash化されたユーザーデータが格納されている。
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログインしました'
    else
      redirect_to root_path, notice: 'ログインできませんでした'
    end
  end
end
