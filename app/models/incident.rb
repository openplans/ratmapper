class Incident < ActiveRecord::Base
  Kinds = %w{rat garbage}
  
  belongs_to :stop

  validates :stop_id, :presence => true
  validates :kind, :inclusion => { :in => Kinds }
  validates :happened_at, :presence => true
  
  def happened_at_display
    self.happened_at.strftime("%b %-d '%y %l:%M %P")
  end
end