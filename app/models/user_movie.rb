class UserMovie < ApplicationRecord
  belongs_to :user_group
  belongs_to :movie
end
