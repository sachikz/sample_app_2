class User < ApplicationRecord
  def self.find_or_create_from_auth_hash(auth_hash)
    #OmniAuthで取得した各データを変数に代入する
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
end
