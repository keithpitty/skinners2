class ByHoleReportData

  def initialize
    @holes = {}
    (1..18).each { |n| @holes[n] = HoleData.new(n, Score.for_hole(n).sum(:points)) }
    rank_holes
  end

  def by_hole_data
    result = [["#", "Total Points", "Rank"]]
    (1..18).each { |n| result << [n.to_s, @holes[n].points.to_s, @holes[n].rank] }
    result
  end

  def table_options
    {
      cell_style:   { size: 10 },
      header:       true,
      row_colors:         ["ffffff", "eeeeee"]
    }
  end

  private

  def rank_holes
    holes_sorted_by_rank = @holes.values.sort { |x, y| x.points <=> y.points }
    holes_sorted_by_rank.each_with_index do |h, i| 
      h.rank = i + 1
      @holes[h.number] = h 
    end
  end

end
