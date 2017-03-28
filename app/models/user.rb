class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  has_many :memberships
  has_many :groups, through: :memberships
  has_secure_password
end
