class Role < ActiveRecord::Base
    has_many :auditions

    # returns an array of names from the actors associated with 
    # this role
    def actors
        self.auditions.pluck( :actor )
    end

    # returns an array of locations from the auditions 
    # associated with this role
    def locations
        self.auditions.pluck( :location )
    end

    # returns the first instance of the audition that was hired 
    # for this role or returns a string 'no actor has been hired 
    # for this role'
    def lead
        #       ...two ways to the same solution...
        # actors = self.auditions.where( hired: true )
        # actors.exists? ? actors.first : 'no actor has been hired for this role'
    
        actor = self.auditions.find_by( hired: true )
        actor ? actor : 'no actor has been hired for this role'
    end

    # returns the second instance of the audition that was hired 
    # for this role or returns a string 'no actor has been hired 
    # for understudy for this role'
    def understudy
        actors = self.auditions.where( hired: true ).second
        actors ? actors : 'no actor has been hired for understudy for this role'
    end
end