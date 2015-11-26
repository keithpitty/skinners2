require 'prawn'

class PlayerReport

  def initialize(player)
    @player = player
    @filename = "reports/#{player.last_name.downcase}_#{player.first_name.downcase}.pdf"
  end

  def generate
    puts "Generating report for #{@player.name}"
    data = PlayerReportData.new(@player)
    Prawn::Document.generate(@filename) do
      font "Helvetica"
      font_size 14
      text data.heading
      text " "
      if data.exists_for_season?
        table data.table_data, data.table_options
      else
        text "No rounds recorded for season."
      end
    end
  end

end
