class ChangeColumns < ActiveRecord::Migration
  def change
    remove_column :members, :password
    remove_column :members, :username
  end
end
