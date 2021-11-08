class Role < ActiveRecord::Base

    has_many :auditions

    def actors
        self.auditions.map {|a| a.actor}

        # new_array = []
        # self.auditions.each do |a|
        #     newArray.push(a.actor)
        # end
        # new_array
    end

    def locations
        self.auditions.map {|a| a.location}
    end

    def lead
        found = self.auditions.find_by(hired: true)

        # if !found
        #     'no actor has been hired for this role'
        # else
        #     found
        # end

        # or the same using ternary logic:
        !found ? 'no actor has been hired for this role' : found


    end

    def understudy
        # find if more than one got hired?
        # if yes, return second one
        # if no, give string
        data = self.auditions.where(hired: true)
        if data.size > 1
            data[1]
        else
            'no actor has been hired for understudy for this role'
        end
    end
    
end