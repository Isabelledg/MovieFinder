class CreateUserStreamers < ActiveRecord::Migration[6.1]
  def change
    create_table :user_streamers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :streamer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
