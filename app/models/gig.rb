class Gig < ActiveRecord::Base
    belongs_to :member

    validates_presence_of :gig_name, :date, :location
end
