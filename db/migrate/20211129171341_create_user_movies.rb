class CreateUserMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :user_movies do |t|
      t.references :user_group, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
