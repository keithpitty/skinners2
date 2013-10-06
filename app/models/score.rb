class Score < ActiveRecord::Base
  belongs_to :player
  belongs_to :round
  belongs_to :player_round
  belongs_to :hole
end
