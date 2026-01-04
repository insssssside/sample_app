class User < ApplicationRecord
  # before_save { self.email = email.downcase }
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  # ..に対応済みの正規表現
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }
  # 演習 : minimumの横の数字で最小文字数変更可能
  # test/models/user_test.rb 'password should have a minimum length' に注意
end
