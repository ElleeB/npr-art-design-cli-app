class NprDesign::Scraper

  @stories_array = []

  def self.menu_scraper(menu_url)
    # gets title, story.url
    doc = Nokogiri::HTML(open(menu_url))
    stories = doc.css("section#main-section")
    stories.each do |story|
      @stories = stories.css("h2.title a")
    end
    @stories.each do |x|
      @menu_hash = {:title => nil, :url => nil}
      @menu_hash[:title] = "#{x.text}"
      @menu_hash[:url] = "#{x['href']}"
      @stories_array << @menu_hash
    end
    @stories_array
  end

  def self.story_scraper(stories_array)
    # @story_hash = {:author => nil, :category => nil, :blurb => nil, :text => nil, :date => nil}
    # # gets text and additional story attributes
    # @menu_hash[:url]
  end

end
