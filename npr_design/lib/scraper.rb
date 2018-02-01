class NprDesign::Scraper

  def self.menu_scraper(menu_url)
    doc = Nokogiri::HTML(open(menu_url))
    stories = doc.css("article")
    info = stories.css("div.item-info")

    @stories_array = []
    # gets all attributes for menu page - author and text added once a story is selected
    info.each do |story|
      menu_hash = {:title => nil, :blurb => nil, :category => nil, :url => nil}
      menu_hash[:title] = story.css("h2.title").text
      menu_hash[:category] = story.css("h3.slug a").text
      menu_hash[:blurb] = story.css("p.teaser").text #minus the first however many characters to remove date
      menu_hash[:url] = story.at("p.teaser a")["href"]
      @stories_array << menu_hash
    end
    @stories_array
  end

end
