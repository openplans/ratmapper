class Route < ActiveRecord::Base
  validates :name, :presence => true
end
