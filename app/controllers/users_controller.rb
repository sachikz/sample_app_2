class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  #外部から使えないようにする
  private
    
    #beforeアクション
    #ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Twitterアカウントでログインしてください"
        redirect_to root_url
      end
    end
end
