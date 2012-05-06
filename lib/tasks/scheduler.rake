desc "Fetch epizodes from RS site"
task :import_feed => :environment do
  puts "Updating feed..."
  Episode.import
  puts "done."
end