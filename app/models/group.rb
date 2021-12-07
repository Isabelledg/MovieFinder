class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  belongs_to :user

  belongs_to :genre

  attribute :password_confirmation, type: String

  validates :password, confirmation: true, presence: true
  validates :name, presence: true, length: { maximum: 15 }
end
