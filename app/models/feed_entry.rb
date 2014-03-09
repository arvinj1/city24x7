class FeedEntry < ActiveRecord::Base
   
  feedTem=Struct.new :x,:y,:z
  @@fa=Array.new()
  @@fa[0]=feedTem.new("www.villagevoice.com/syndication/events/","VVoice","added via villae voice")
  @@fa[1]=feedTem.new("www.citylimits.org/rss/rss.cfm?feed=calendar","CLimits","added by climits")
  @@fa[2]=feedTem.new("www.nyc.com/events/all/feed.rss","NYCPVT","added via ncy.com")
  
  def self.update_from_feed(feed_url,source,desc)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries,source,desc)
  end
  
  def self.update_from_feed_id(id)
    l=@@fa.at(id)
    feed = Feedzirra::Feed.fetch_and_parse(l.x)
    add_entries(feed.entries,l.y,l.z)
  end
  
  def self.update_from_feed_continuously (feed_url,source,desc)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
      add_entries(feed.entries,source,desc)
      loop do
        sleep delay_interval.to_i
        feed = Feedzirra::Feed.update(feed)
        add_entries(feed.new_entries,source,desc) if feed.updated?
      end 
  end
  
  private
    def self.add_entries(entries,source,desc)
      entries.each do |entry|
        unless exists? :guid => entry.id 
          create!(
            :name         => entry.title,
            :summary      => entry.summary,
            :url          => entry.url,
            :published_at => entry.published,
            :guid         => entry.id,
            :source       => source,
            :desc         => desc
          )
        end
      end
    end
end
