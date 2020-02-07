class Member < ActiveRecord::Base
    has_many :gigs
    has_secure_password

    validates_presence_of :email, :password, :full_name, :instrument

end
