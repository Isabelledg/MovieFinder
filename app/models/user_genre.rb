class UserGenre < ApplicationRecord
  belongs_to :user_group
  belongs_to :genre
end
