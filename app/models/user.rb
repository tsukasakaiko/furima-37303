class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :family_name
    validates :farst_name
  end

  with_options presence: true, format: { with: /\A[\p{katakana}ー]+\z/ } do
    validates :family_name_kana
    validates :farst_name_kana
  end

  validates :birth_day, presence: true
end
