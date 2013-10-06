class Player < ActiveRecord::Base
  has_many :player_rounds
  has_many :rounds, :through => :player_rounds
  has_many :scores
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :player_number, presence: true
end
