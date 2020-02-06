class Member < ActiveRecord::Base
    has_many :gigs

    validates_presence_of :email, :password, :full_name, :instrument
end
