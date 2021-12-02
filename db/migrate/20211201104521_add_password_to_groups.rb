class AddPasswordToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :password, :string, null: false
  end
end
