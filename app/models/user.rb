class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: "is invalid. Input half-width characters."
    validates :birthday
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."} do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."} do
    validates :first_name_kana
    validates :last_name_kana
  end

  has_many :products
  has_one :purchase_history
end
