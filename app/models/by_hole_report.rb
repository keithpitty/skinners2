class ByHoleReport

  def initialize
    
  end

  def generate
    Prawn::Document.generate("reports/by_hole.pdf") do
      font "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf"
      font_size 14
      text "#{Date.today.year} Saturday Skins: Totals by Hole"
      text " "
      text " "
      data = ByHoleReportData.new
      table data.by_hole_data, data.table_options
    end
  end

end
