namespace :report do

  desc "Generate player reports"
  task :players => :environment do
    puts "About to generate reports for #{Player.count} players..."
    Player.all.each { |player| PlayerReport.new(player).generate}
  end

end
