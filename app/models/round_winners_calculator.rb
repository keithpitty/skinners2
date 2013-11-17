class RoundWinnersCalculator

  def initialize(round)
    @round = round
    @winners = {}
  end

  def winners
    skins = 0
    (1..18).each do |hole|
      skins += 1
      if skins_winner?(hole)
        update_winners(skins_winner(hole), skins)
        skins = 0
      end
    end
    @winners
  end

  private

  def skins_winner?(hole)
    best_scores(hole).count == 1
  end

  def best_scores(hole)
    scores(hole).where(points: most_points(hole))
  end

  def scores(hole)
    @round.scores.where(hole_id: hole)
  end

  def most_points(hole)
    scores(hole).to_a.map(&:points).max
  end

  def update_winners(player_name, skins)
    @winners[player_name] = skins + skins_so_far(player_name)
  end

  def skins_winner(hole)
    best_scores(hole).first.player.name
  end

  def skins_so_far(player_name)
    @winners[player_name] ? @winners[player_name] : 0
  end

end
