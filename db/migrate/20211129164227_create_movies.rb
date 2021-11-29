class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :rating
      t.integer :length
      t.string :director

      t.timestamps
    end
  end
end
