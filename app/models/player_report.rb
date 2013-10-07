require 'prawn'
require 'prawn/layout'

class PlayerReport

  def initialize(player)
    @player = player
    @filename = "reports/#{player.first_name.downcase}_#{player.last_name.downcase}.pdf"
  end

  def perform
    puts "Generating report for #{@player.name}"
    Prawn::Document.generate(@filename) do
      font "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf"
      font_size 14
      text "2012 Saturday Skins: #{player.full_name}"
      text " "
      if player.has_played_this_season?
        table report_data, table_options
      else
        text "No rounds recorded for season."
      end
    end
  end

  private

  def report_data
    data = []
    player_rounds.each { |player_round| data << PlayerRoundData.new(player_round).data }
    data << totals
  end

  def player_rounds
    @player.player_rounds(:include => :scores)
  end

  def totals
    
  end

  def table_options
    { 
      font_size:          9,
      position:           :left,
      headers:            ["Date", " 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", 
                          "10", "11", "12", "13", "14", "15", "16", "17", "18",
                          "3P", "4P", "5P", "Total", "Skins", "  $", "NTP"],
      row_colors:         ["ffffff", "eeeeee"],
      vertical_padding:   1.6,
      horizontal_padding: 2.9
    }
  end

end