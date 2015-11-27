class NoThreePointersData

  def initialize
    @achievers = {}
    @summary = {}
  end

  def no_3_pointers_data
    result = [["#", "Golfers"]]
    summary.each { |k,v| result << [k, v] }
    result
  end

  def table_options
    {
      cell_style:   { size: 10 },
      header:       true,
      row_colors:   ["ffffff", "eeeeee"]
    }
  end

  private

  def summary
    find_players_with_no_three_pointers
    @achievers.each do | player, count|
      if @summary.include?(count.to_s)
        @summary[count.to_s] << ", #{player.name}"
      else
        @summary[count.to_s] = player.name
      end
    end
    @summary.sort { |a, b| b <=> a }
  end

  def find_players_with_no_three_pointers
    PlayerRound.all.each do |player_round|
      add_no_three_pointer_achievement(player_round.player) if player_round.no_three_pointers?
    end
  end

  def add_no_three_pointer_achievement(player)
    if @achievers.include?(player)
      @achievers[player] += 1
    else
      @achievers[player] = 1
    end
  end
end
