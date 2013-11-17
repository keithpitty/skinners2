class PlayerTotalsData

  def initialize(player_rounds)
    @player_rounds = player_rounds
    @totals_data = []
    @hole_totals = {}
    (1..18).each { |h| @hole_totals[h] = 0 }
    @total_points = 0
    @total_3_pointers = 0
    @total_4_pointers = 0
    @total_5_pointers = 0
    @total_skins = 0
    @total_ntp = 0
  end

  def totals_data
    @totals_data << "TOTALS"
    @player_rounds.each do |player_round|
      player_round.scores.each do |score|
        @hole_totals[score.hole.number] += score.points
        @total_points += score.points
        @total_3_pointers += 1 if score.points == 3
        @total_4_pointers += 1 if score.points == 4
        @score_5_pointers += 1 if score.points == 5
      end
      @total_skins += skins_for_round(player_round)
    end
    @hole_totals.each_value { |t| @totals_data << t.to_s }
    @totals_data << @total_3_pointers.to_s
    @totals_data << @total_4_pointers.to_s
    @totals_data << @total_5_pointers.to_s
    @totals_data << @total_points.to_s
    @totals_data << @total_skins.to_s
    @totals_data << (@total_skins * 3).to_s
    @totals_data << @total_ntp.to_s
  end

  private

  def skins_for_round(player_round)
    player_name = player_round.player.name
    winners = RoundWinnersCalculator.new(player_round.round).winners
    winners.include?(player_name) ? winners[player_name] : 0 
  end

end
