class User < ApplicationRecord
  before_save { self.email = email.downcase }  #before_saveコールバックにブロックを渡してユーザーのメールアドレスを設定します。設定されるメールアドレスは、現在の値をStringクラスのdowncaseメソッドを使って小文字バージョンにしたもの
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #メールアドレス検証の条件
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },#フォーマットを条件と確認
  uniqueness: { case_sensitive: false } #一意性を確認
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
