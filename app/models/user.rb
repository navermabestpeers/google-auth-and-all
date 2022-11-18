class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, omniauth_providers: [:google_oauth2, :twitter, :facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name 
      user.avatar_url = auth.info.image 
      
    end
  end
  
  # def self.sign_in_from_omniauth(auth)
  #   find_by(provider: auth['provider'], uid: auth['uid']) ||create_user_from_omniauth(auth)
  # end
  
  # def self.create_user_from_omniauth(auth)
  #   create(
  #     provider: auth['provider'],
  #     uid: auth['uid'],
  #     name: auth['info']['name']

  #   )
  # end
end
