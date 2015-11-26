class TopTwentyReport

  def initialize
    
  end

  def generate
    Prawn::Document.generate("reports/top_20.pdf") do
      font "Helvetica"
      font_size 14
      text "#{Date.today.year} Saturday Skins: Top 20 Points Getters"
      text " "
      text " "
      data = TopTwentyReportData.new
      table data.top_20_data, data.table_options
    end
  end

end
