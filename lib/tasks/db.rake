namespace :db do
  desc "Load initial data."
  task :seed => :environment do
    puts "Loading holes..."
    (1..18).each { |n| Hole.create!(number: n) }

    require 'active_record/fixtures'

    Dir.glob("#{Rails.root}/db/initial_data/*.yml").each do |file|
      base_name = File.basename(file, '.*')
      puts "Loading #{base_name}..."
      ActiveRecord::FixtureSet.create_fixtures('db/initial_data', base_name)
    end
  end

  desc "This drops the db, builds the db, and seeds the data."
  task :reseed => [:environment, 'db:reset', 'db:seed']
end