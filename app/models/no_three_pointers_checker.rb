class NoThreePointersChecker

  def initialize(row, params)
    @row = row
    @player_round = params[:player_round]
  end

  def perform
    @player_round.update_attributes(no_three_pointers: true) if no_three_pointers?
  end

  private

  def no_three_pointers?
    @row[21] && @row[21] == 'Y'
  end

end