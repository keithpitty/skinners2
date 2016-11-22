class TopTwentyReportData

  def initialize
    @players_data = []
    players = Player.where(active: true)
    players.each { |p| @players_data << PlayerTotalsData.new(p) }
    @players_data.sort! { |a, b| b.total_points <=> a.total_points }
  end

  def top_20_data
    result = [["#", "Player", "Points"]]
    previous_points = 0
    (1..20).each do |i|
      rank = adjusted_rank(i, @players_data[i-1].total_points, previous_points)
      result << [ rank, @players_data[i-1].name, @players_data[i-1].total_points.to_s ]
      previous_points = @players_data[i-1].total_points
    end
    result
  end

  def table_options
    {
      cell_style:   { size: 10 },
      header:       true,
      row_colors:         ["ffffff", "eeeeee"]
    }
  end

  private

  def adjusted_rank(rank, points, previous_points)
    points == previous_points ? (rank - 1).to_s : rank.to_s
  end

end
