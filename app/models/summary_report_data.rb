class SummaryReportData

  def initialize
    
  end

  def summary_data
    result = [headers]
    players = Player.where(active: true).sort_by { |p| p.last_name.downcase }
    players.each { |player| result << PlayerTotalsData.new(player).data_for_summary }
    result
  end

  def table_options
    { 
      cell_style:         { size: 7.5, padding: [1.6, 2.9] },
      header:             true,
      row_colors:         ["ffffff", "eeeeee"]
    }
  end

  private

  def headers
    ["Name", " 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", 
    "10", "11", "12", "13", "14", "15", "16", "17", "18",
    "3P", "4P", "5P", "Total", "Skins", "  $", "NTP"]
  end
end
