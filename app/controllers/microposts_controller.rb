class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new, :index]
  before_action :correct_user,   only: :destroy
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      render :new and return
    end
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end
  
  def new
    @micropost = current_user.microposts.build if logged_in?
  end
  
  def index
    redirect_to new_micropost_path
  end
  
  private
    
    #Strong Parametersを使ってマイクロポストの限られた属性だけWeb経由で変更可能に。
    def micropost_params
      params.require(:micropost).permit(:content, :child_age, :picture)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
