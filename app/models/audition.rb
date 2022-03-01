class Audition < ActiveRecord::Base
  belongs_to :role

  def call_back
    # binding.pry
    #! self.hired = true
    #! self.save

    self.update(hired: true)
  end
end