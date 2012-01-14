class Station < ActiveRecord::Base
  validates :name, :presence => true
  validates :latitude, :presence => true
  validates :longitude, :presence => true
end
