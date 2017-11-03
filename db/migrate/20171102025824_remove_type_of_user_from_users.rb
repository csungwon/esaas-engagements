class RemoveTypeOfUserFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :typeUser, :string
  end
end
