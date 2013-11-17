class PlayerRoundData

  def initialize(player_round)
    @player_round = player_round
    @player = player_round.player
    @player_round_data = []
  end

  def data
    @player_round_data << @player_round.date_played.strftime("%d/%m/%Y")
    concatenate_points_for_holes
    concatenate_x_pointers
    @player_round_data << total_points.to_s
    @player_round_data << skins.to_s
    @player_round_data << dollars.to_s
    @player_round_data << no_three_pointers
    @player_round_data
  end

  private

  def concatenate_points_for_holes
    (1..18).each { |h| @player_round_data << @player_round.points_for_hole(h).to_s }
  end

  def concatenate_x_pointers
    (3..5).each { |n| @player_round_data << x_pointers_count(n) }
  end

  def x_pointers_count(n)
    count = 0
    (1..18).each { |h| count += 1 if (@player_round.points_for_hole(h) == n) }
    count.to_s
  end

  def total_points
    total = 0
    @player_round.scores.each { |score| total += score.points }
    total
  end

  def dollars
    skins * 3
  end

  def skins
    @round_winners ||= round_winners 
    @round_winners.include?(@player.name) ? round_winners[@player.name] : 0
  end

  def round_winners
    RoundWinnersCalculator.new(@player_round.round).winners
  end

  def no_three_pointers
    @player_round.no_three_pointers? ? "****" : ""
  end

end
