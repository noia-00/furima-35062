class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :email,              presence: true
  validates :encrypted_password, presence: { with: /\A[a-z0-9]+\z/i }
  validates :lastname,           presence: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :firstname,          presence: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :lastname_kana,      presence: { with: /\A[ァ-ヶー－]+\z/ }
  validates :firstname_kana,     presence: { with: /\A[ァ-ヶー－]+\z/ }
  validates :date,               presence: true
end
