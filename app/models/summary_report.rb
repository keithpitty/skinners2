class SummaryReport

  def initialize
    
  end

  def generate
    Prawn::Document.generate("reports/summary.pdf") do
      font "Helvetica"
      font_size 14
      text "#{Date.today.year} Saturday Skinners: Summary"
      data = SummaryReportData.new
      table data.summary_data, data.table_options
    end
  end

end
