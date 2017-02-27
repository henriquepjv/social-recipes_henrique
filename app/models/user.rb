class User < ApplicationRecord

  validates :name, :email, :encrypted_password, presence: true

end
