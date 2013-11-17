class PlayerTotalsData

  def initialize(player)
    @player = player
    @player_rounds = player.player_rounds
    @hole_totals = {}
    (1..18).each { |h| @hole_totals[h] = 0 }
    @total_points = 0
    @total_3_pointers = 0
    @total_4_pointers = 0
    @total_5_pointers = 0
    @total_skins = 0
    @total_ntp = 0
    generate_totals
  end

  def totals_data
    data = ["TOTALS"]
    add_totals(data)
  end

  def data_for_summary
    data = [@player.name]
    add_totals(data)
  end

  private

  def generate_totals
    @player_rounds.each do |player_round|
      player_round.scores.each do |score|
        @hole_totals[score.hole.number] += score.points
        @total_points += score.points
        @total_3_pointers += 1 if score.points == 3
        @total_4_pointers += 1 if score.points == 4
        @total_5_pointers += 1 if score.points == 5
      end
      @total_skins += skins_for_round(player_round)
      @total_ntp += 1 if player_round.no_three_pointers?
    end
  end

  def add_totals(data)
    @hole_totals.each_value { |t| data << t.to_s }
    data << @total_3_pointers.to_s
    data << @total_4_pointers.to_s
    data << @total_5_pointers.to_s
    data << @total_points.to_s
    data << @total_skins.to_s
    data << (@total_skins * 3).to_s
    data << @total_ntp.to_s
    data
  end

  def skins_for_round(player_round)
    player_name = player_round.player.name
    winners = RoundWinnersCalculator.new(player_round.round).winners
    winners.include?(player_name) ? winners[player_name] : 0 
  end

end
