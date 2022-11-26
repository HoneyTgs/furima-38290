class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true 

  VALID_NAME_REGEX =/\A[ぁ-んァ-ン一-龥]+\z/

  with_options presence: true do
  validates :last_name, format: { with: VALID_NAME_REGEX, message: 'Full-width characters.' }
  validates :first_name, format: { with: VALID_NAME_REGEX, message: 'Full-width characters.' }
  end

  validates :last_name_kana,  presence: true, format: { with: /\A[\p{katakana}\p{blank}ーー]+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ーー]+\z/} 
  validates :birth_day,       presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
