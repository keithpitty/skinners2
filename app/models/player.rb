class Player < ActiveRecord::Base
  has_many :player_rounds
  has_many :rounds, :through => :player_rounds
  has_many :scores
  validates :first_name, :last_name, :player_number, presence: true
  validates :player_number, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end
  
  def has_played_this_season?
    player_rounds.size > 0
  end
  
end
