class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :date
      t.string :location
      t.integer :member_id
      t.timestamps null: false
    end
  end
end
