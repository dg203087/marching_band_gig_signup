class AddGigColumns < ActiveRecord::Migration
  def change
    add_column :gigs, :attending, :boolean, default: false
    add_column :gigs, :gig_name, :string
  end
end
