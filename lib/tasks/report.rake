namespace :report do

  desc "Generate player reports"
  task :players => :environment do
    puts "About to generate reports for #{Player.count} players..."
    Player.where(active: true).each { |player| PlayerReport.new(player).generate }
  end

  desc "Generate summary report"
  task :summary => :environment do
    puts "Generating summary report..."
    SummaryReport.new.generate
  end

  desc "Generate top 10 points getters report"
  task :top10 => :environment do
    puts "Generating top 10 report..."
    TopTenReport.new.generate
  end

end
