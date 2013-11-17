class SummaryReport

  def initialize
    
  end

  def generate
    Prawn::Document.generate("reports/summary.pdf") do
      font "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf"
      font_size 14
      text "2012 Saturday Skinners: Summary"
      data = SummaryReportData.new
      table data.summary_data, data.table_options
    end
  end

end
