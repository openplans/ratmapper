class Stop < ActiveRecord::Base

  scope :station, where(:station => true)
  
  has_many :incidents
end
