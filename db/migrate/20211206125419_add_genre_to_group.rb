class AddGenreToGroup < ActiveRecord::Migration[6.1]
  def change
    add_reference :groups, :genre, foreign_key: true
  end
end
