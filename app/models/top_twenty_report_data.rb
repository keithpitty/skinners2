class TopTwentyReportData

  def initialize
    @players_data = []
    players = Player.where(active: true)
    players.each { |p| @players_data << PlayerTotalsData.new(p) }
    @players_data.sort! { |a, b| b.total_points <=> a.total_points }
  end

  def top_20_data
    result = [["#", "Player", "Points"]]
    (1..20).each { |i| result << [ i.to_s, @players_data[i-1].name, @players_data[i-1].total_points.to_s ] }
    result
  end

  def table_options
    {
      cell_style:   { size: 10 },
      header:       true,
      row_colors:         ["ffffff", "eeeeee"]
    }
  end

end
