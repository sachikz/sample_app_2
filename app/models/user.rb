class User < ApplicationRecord
  def self.find_or_create_from_auth_hash(auth_hash)
    #OmniAuthで取得した各データを変数に代入する
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    user_name = auth_hash[:info][:user_name]
    image_url = auth_hash[:info][:image]
    
    self.find_or_create_by(provider: provider, uid: uid) do |user|
    #find_or_create_by()は()の中の条件のものが見つかれば取得し、なければ新規作成するというメソッド。
      user.user_name = user_name
      user.image_url = image_url
    end
  end
  
  #渡された文字列のハッシュ値を返す ※これ使わないかも？？
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost:cost)
  end
end
