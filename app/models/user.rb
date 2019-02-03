class User < ApplicationRecord
  devise :omniauthable, :rememberable

  enum role: [:user, :admin]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
    end
  end
end
