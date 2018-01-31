class NprDesign::Scraper

  def self.menu_scraper(menu_url)
    @stories_array = []
    doc = Nokogiri::HTML(open(menu_url))
    stories = doc.css("article")
    info = stories.css("div.item-info")

    info.each do |story|
      @menu_hash = {:title => nil, :url => nil, :category => nil, :blurb => nil}
      @menu_hash[:title] = story.css("h2.title").text
      @menu_hash[:url] = story.at("p.teaser a")["href"]
      @menu_hash[:category] = story.css("h3.slug a").text
      @menu_hash[:blurb] = story.css("p.teaser").text #minus the first however many characters to remove date
      @stories_array << @menu_hash
    end

    @stories_array
  end

end
