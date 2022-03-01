class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    # pluck = Active Record Method 
    # order (useful method)
    # where (useful method)
    self.auditions.pluck(:actor)
  end

  def locations
    self.auditions.pluck(:location)
  end

  def lead
    # find_by returns the first instance
    found = self.auditions.find_by(hired: true)
    return 'no actor has been hired for this role' unless found
    found
  end

  def understudy
    second = self.auditions.where(hired: true)[1]
    return 'no actor has been hired for this role' unless second
    second
  end
end