class TopTenReport

  def initialize
    
  end

  def generate
    Prawn::Document.generate("reports/top_10.pdf") do
      font "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf"
      font_size 14
      text "2012 Saturday Skins: Top 10 Points Getters"
      text " "
      text " "
      data = TopTenReportData.new
      table data.top_10_data, data.table_options
    end
  end

end
