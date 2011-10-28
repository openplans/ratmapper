class Incident < ActiveRecord::Base
  Kinds = %w{rat garbage}
  
  belongs_to :stop

  validates :stop_id, :presence => true
  validates :kind, :inclusion => { :in => Kinds }
  validates :happened_at, :presence => true
  
end