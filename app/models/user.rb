class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  with_options presence: true do
    validates :nickname
    validates :lastname,           format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
    validates :firstname,          format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
    validates :lastname_kana,      format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :firstname_kana,     format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
