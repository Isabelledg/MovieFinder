class UserGroup < ApplicationRecord
  attr_accessor :password
  belongs_to :user
  belongs_to :group

  has_many :user_movies
  has_many :movies, through: :user_movies

  validates :user, :group, presence: true
  validates :user, uniqueness: { scope: :group }

  attribute :password, type: String
  validate :valid_password, on: :create

  

  private

  def valid_password
    return true if password == group.password

    errors.add(:password, "is invalid")
  end
end
