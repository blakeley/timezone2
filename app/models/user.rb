class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, email: true
  has_secure_password
  before_create :generate_access_token

  def generate_access_token
    self.access_token = SecureRandom.hex
  end

end
