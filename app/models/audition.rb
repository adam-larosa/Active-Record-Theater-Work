class Audition < ActiveRecord::Base
    belongs_to :role


    # Audition#call_back will change the the hired attribute to true

    def call_back
        # self.hired = true
        # self.save

        self.update(hired: true)

    end

end


