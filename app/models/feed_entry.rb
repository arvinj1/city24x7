class FeedEntry < ActiveRecord::Base
  
  has_many 
  feedTem=Struct.new :a,:x,:y,:z
  
  
  @@fa=Array.new()
  @@fa[0]=feedTem.new("events","www.villagevoice.com/syndication/events/","VVoice","added via villae voice")
  @@fa[1]=feedTem.new("events","www.citylimits.org/rss/rss.cfm?feed=calendar","CLimits","added by climits")
  @@fa[2]=feedTem.new("events","www.nyc.com/events/all/feed.rss","NYCPVT","added via ncy.com")
  @@fa[3]=feedTem.new("parks","http://feeds.feedburner.com/NycParksDailyPlant","NYCPARKS","added via ncy.com")
  @@fa[4]=feedTem.new("parks","http://feeds.feedburner.com/NycParksPressReleases","NYCPARKS","added via ncy.com")
  
  @@fa[5]=feedTem.new("parks","http://feeds.feedburner.com/NycParksMediaAdvisories","NYCPARKS","added via ncy.com")
  @@fa[6]=feedTem.new("parks","http://feeds.feedburner.com/NycParksUpcomingEvents","NYCPARKS","added via ncy.com")
  @@fa[7]=feedTem.new("parks","http://feeds.feedburner.com/CentralParkEvents","NYCPARKS","added via ncy.com")
  
  
  def self.feedlist
    @@fa
  end
  
  def self.update_from_feed(feed_url,source,desc,what)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries,source,desc.what)
  end
  
  def self.update_from_feed_id(id)
    l=@@fa.at(id)
    feed = Feedzirra::Feed.fetch_and_parse(l.x)
    add_entries(feed.entries,l.y,l.z,l.a)
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
    def self.add_entries(entries,source,desc,what)
      entries.each do |entry|
        unless exists? :guid => entry.id 
          create!(
            :name         => entry.title,
            :summary      => entry.summary,
            :url          => entry.url,
            :published_at => entry.published,
            :guid         => entry.id,
            :source       => source,
            :desc         => desc,
            :content      => entry.content,
            :kind         => what
          )
        end
      end
    end
end
