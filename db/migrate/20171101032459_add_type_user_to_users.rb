class AddTypeUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :typeUser, :string
  end
end
