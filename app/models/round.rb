class Round < ActiveRecord::Base
  has_many :player_rounds
  has_many :players, :through => :player_rounds
  has_many :scores
end
