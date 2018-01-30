class NprDesign::Scraper

  @stories_array = []

  def self.menu_scraper(menu_url)
    # gets title, author, story.url
    doc = Nokogiri::HTML(open(menu_url))
    stories = doc.css("h2.title").css("a")
    links = stories.search("a").map{|a| a["href"]}
    links
    #=> returns array of urls
  end

  def self.story_scraper(story_url)
    # story.url
    # gets text and additional story attributes
  end

end
