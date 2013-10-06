class ScoresCreator

  def initialize(row, params)
    @row = row
    @player_round = params[:player_round]
  end

  def perform
    (1..18).each { |hole| create_score(hole) if score_entry(hole).present? }
  end

  private

  def create_score(hole)
    Score.create!(player: @player_round.player,
                  round: @player_round.round,
                  player_round: @player_round,
                  hole: Hole.find(hole),
                  points: score_entry(hole).to_i)
  end

  def score_entry(hole)
    @row[hole + 2]
  end

end