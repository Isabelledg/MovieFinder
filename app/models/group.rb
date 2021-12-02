class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups

  attribute :password_confirmation, type: String

  validates :password, confirmation: true, presence: true
  validates :name, presence: true
end
