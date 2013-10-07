class PlayerRound < ActiveRecord::Base
  belongs_to :player
  belongs_to :round
  has_many :scores

  def points_for_hole(hole)
    @scores_hash[hole_number] ? @scores_hash[hole_number].points : 0
  end

  private

  def scores_hash
    @scores_hash ||= derive_hash
  end

  def derive_hash
    scores_hash = {}
    scores.each { |scores| scores_hash[score.hole_number] = score }
    scores_hash
  end

end
