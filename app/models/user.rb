class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  attr_accessor :remember_token
  
  #OmniAuthで取得した各データを変数に代入する
  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]
    
    self.find_or_create_by(provider: provider, uid: uid) do |user|
    #find_or_create_by()は()の中の条件のものが見つかれば取得し、なければ新規作成するというメソッド。
      user.nickname = nickname
      user.image_url = image_url
    end
  end
  
  #渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  #ランダムな記憶トークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  #記憶トークンをデータベースに保存する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  #渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  #データベースの記憶トークンを破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def feed
    Micropost.where("user_id = ?", id)
  end
end
