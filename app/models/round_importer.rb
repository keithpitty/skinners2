require 'csv'

class RoundImporter

  def initialize(file_base_name)
    @file_name = "db/input_data/#{file_base_name}.csv"
    @round = Round.create!(date_played: date_played(file_base_name[5..12]))
  end

  def perform
    CSV.foreach(@file_name, csv_options) do |row|
      unless header?(row)
        player_round = PlayerRound.create!(player: player(row[0]), round: @round)
        ScoresCreator.new(row, player_round: player_round).perform
        NoThreePointersChecker.new(row, player_round: player_round).perform
      end
    end
  end

  private

  def date_played(yyyymmdd)
    Date.parse(yyyymmdd)
  end

  def csv_options
    { quote_char: '"', col_sep: ',', row_sep: :auto, encoding: 'UTF-8' }
  end

  def header?(row)
    row.first == 'Player number'
  end

  def player(player_number)
    Player.find_by player_number: player_number
  end

end
