class NoThreePointersReport

  def initialize
    
  end

  def generate
    Prawn::Document.generate("reports/no_3_pointers.pdf") do
      font "Helvetica"
      font_size 14
      text "#{Date.today.year} Saturday Skins: No 3 Pointers"
      text " "
      text " "
      data = NoThreePointersData.new
      table data.no_3_pointers_data, data.table_options
    end
  end
end
