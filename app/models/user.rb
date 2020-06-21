class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable,
         :omniauthable, omniauth_providers: [:twitter]
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
   def self.find_for_oauth(auth)
           user = User.where(uid: auth.uid, provider: auth.provider).first

           unless user
              user = User.create(
           uid:      auth.uid,
           provider: auth.provider,
           email:    User.dummy_email(auth),
           password: Devise.friendly_token[0, 20],
           image: auth.info.image,
           name: auth.info.name,
           username: auth.info.nickname,
           )

       end
      user.skip_confirmation!
   user
  end

  def already_liked?(comment)
    self.likes.exists?(comment_id: comment.id)
  end

  private

  def self.dummy_email(auth)
   "#{auth.uid}-#{auth.provider}@example.com"
  end
end
