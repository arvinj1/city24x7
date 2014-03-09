desc "This task updates the RSS feeds from the 3 sites"
task :update_feed => :environment do
  puts "Updating feed..id 1."
  FeedEntry.update_from_feed_id(0)
  puts "done."
  
  puts "Updating feed..id 2."
  FeedEntry.update_from_feed_id(1)
  puts "done."
  
  puts "Updating feed..id 3."
  FeedEntry.update_from_feed_id(2)
  puts "done."
end