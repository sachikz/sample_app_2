class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  #外部から使えないようにする
  private
    
    #beforeフィルター
    
    #正しいユーザーかどうかを確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    #管理者かどうかを確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
