class User < ApplicationRecord
  devise :omniauthable, :rememberable

  enum role: [:user, :admin]
  has_many :translations, inverse_of: :author, dependent: :nullify

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
    end
  end
end
