class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    user_name = auth.info.name
    email = auth[:email]
    
    # GitHubでログインした時にauth[:info][:name]から値が取れなかったが後者からは取れたので
    image_url = auth[:info][:image]


    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.user_name = user_name
      user.image_url = image_url
      user.email = email
    end
  end
end
