module UsersHelper
  
  #ユーザーがTwitterで設定してるプロフィール画像を返す
  def user_image(user)
    user_image_url = user.image_url
    image_tag(user_image_url, alt: "ユーザーの画像", class: "twitter_icon")
  end
end
