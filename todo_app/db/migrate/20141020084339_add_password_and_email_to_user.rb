class AddPasswordAndEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :email, :string
  end
end
