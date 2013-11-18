class ByHoleReportData

  def initialize
    
  end

  def by_hole_data
    result = [["#", "Total Points"]]
    (1..18).each do |n|
      total_for_hole = Score.for_hole(n).sum(:points)
      result << [n.to_s, total_for_hole.to_s]
    end
    result
  end

  def table_options
    {
      cell_style:   { size: 10 },
      header:       true,
      row_colors:         ["ffffff", "eeeeee"]
    }
  end

end
