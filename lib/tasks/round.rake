namespace :round do

  desc "Load scores for a round (use paramater in yyyymmdd format)"
  task :load, [:yyyymmdd] => :environment do |t, args|
    yyyymmdd = args.yyyymmdd
    puts "Loading round#{yyyymmdd}"
    RoundImporter.new("round#{yyyymmdd}").perform
  end
  
  desc "Load all rounds"
  task :load_all => [:environment, 'db:reseed'] do
    Dir.glob("#{Rails.root}/db/input_data/*.csv").each do |file|
      puts file
      base_name = File.basename(file, '.*')
      puts "Loading #{base_name}..."
      RoundImporter.new(base_name).perform
    end
  end

end