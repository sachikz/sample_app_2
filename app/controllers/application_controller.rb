class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
  
    #ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Twitterアカウントでログインしてください"
        redirect_to root_url
      end
    end
end
