class RoundWinnersReport

  def initialize(round)
    @round = round
  end

  def perform
    @calculator = RoundWinnersCalculator.new(@round)
    @calculator.perform
    report 
  end

  private

  def report
    winners_str = ""
    @calculator.winners.each do |k,v|
      winners_str << ", " unless winners_str.blank?
      winners_str << "#{k}: $#{v * 3}"
    end
    "Winners for #{@round.date_played}: #{winners_str}"
  end

end