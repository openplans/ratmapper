class Incident < ActiveRecord::Base
  Kinds = %w{rat garbage}
  
  belongs_to :station, :inverse_of => :incidents

  validates :station, :presence => true
  validates :kind, :inclusion => { :in => Kinds }
  validates :happened_at, :presence => true
  
  def happened_at_display
    self.happened_at.strftime("%b %-d '%y %l:%M %P")
  end
end