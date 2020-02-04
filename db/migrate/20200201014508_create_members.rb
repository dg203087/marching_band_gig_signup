class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :username
      t.string :password
      t.string :full_name
      t.string :email
      t.string :instrument
      t.timestamps null: false
    end
  end
end
