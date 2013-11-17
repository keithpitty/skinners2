class PlayerReportData

  def initialize(player)
    @player = player
  end

  def heading
    "2012 Saturday Skins: #{@player.name}"
  end

  def exists_for_season?
    @player.has_played_this_season?  
  end

  def table_data
    data = []
    data << headers
    player_rounds.each { |player_round| data << PlayerRoundData.new(player_round).data }
    data << totals
    data
  end

  def table_options
    { 
      cell_style:         { size: 9, padding: [1.6, 2.9] },
      header:             true,
      row_colors:         ["ffffff", "eeeeee"]
    }
  end

  private

  def headers
    ["Date", " 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", 
    "10", "11", "12", "13", "14", "15", "16", "17", "18",
    "3P", "4P", "5P", "Total", "Skins", "  $", "NTP"]
  end

  def player_rounds
    @player.player_rounds(:include => :scores)
  end

  def totals
    PlayerTotalsData.new(player_rounds).totals_data
  end

end
