class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :movies, through: :user_movies

  validates :user, :group, presence: true
  validates :user, uniqueness: { scope: :group }

  attribute :password, type: String
  validate :valid_password

  private

  def valid_password
    return true if password == group.password

    errors.add(:password, "is invalid")
  end
end
