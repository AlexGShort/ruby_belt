class Group < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :memberships
  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
end
