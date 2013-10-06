namespace :round do

  desc "Load scores for a round (use paramater in yyyymmdd format)"
  task :load, [:yyyymmdd] => :environment do |t, args|
    yyyymmdd = args.yyyymmdd
    puts "Loading round#{yyyymmdd}"
    import_round("round#{yyyymmdd}")
  end
  
  desc "Load all rounds"
  task :load_all => [:environment, 'db:reseed'] do
    Dir.glob("#{Rails.root}/db/input_data/*.csv").each do |file|
      puts file
      base_name = File.basename(file, '.*')
      puts "Loading #{base_name}..."
      import_round(base_name)
    end
  end
  
  desc "Report winners etc for a round (use paramater in yyyymmdd format)"
  task :report, [:yyyymmdd] => :environment do |t, args|
    yyyymmdd = args.yyyymmdd
    report_winners(Round.find_by date_played: Date.parse(yyyymmdd))
  end
  
  desc "Load and report for a round (use paramater in yyyymmdd format)"
  task :load_and_report, [:yyyymmdd] => [:environment, :load, :report]
  
  desc "Report winners etc for all rounds"
  task :report_all => :environment do
    Round.all.each {|round| report_winners(round) }
  end

  def import_round(base_name)
    RoundImporter.new(base_name).perform
  end

  def report_winners(round)
    puts RoundWinnersReport.new(round).perform
  end

end