class Score < ActiveRecord::Base
  belongs_to :player
  belongs_to :round
  belongs_to :player_round
  belongs_to :hole

  scope :for_hole, lambda { |hole_number| where('hole_id = ?', hole_number) }
end
