class Gigs < ActiveRecord::Base
    belongs_to :member

    validates_presence_of :gig_name, :date, :location, :attending
end
