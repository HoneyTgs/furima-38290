class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname,        presence: true 

  VALID_NAME_REGEX =/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/

  with_options presence: true do
  validates :last_name, format: { with: VALID_NAME_REGEX}
  validates :first_name, format: { with: VALID_NAME_REGEX}
  end

  validates :last_name_kana,  presence: true, format: { with: /\A[\p{katakana}\p{blank}ーー]+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ーー]+\z/} 
  validates :birth_day,       presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
