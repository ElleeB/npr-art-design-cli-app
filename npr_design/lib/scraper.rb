class NprDesign::Scraper

  def self.menu_scraper(menu_url)
    @menu_hash = {:title => nil, :url => nil}
    # gets title, story.url
    doc = Nokogiri::HTML(open(menu_url))
    stories = doc.css("section#main-section")
    stories.each do |story|
      @stories = stories.css("h2.title a")
    end
    @stories.each do |x|
      @menu_hash[:title] = "#{x.text}"
      @menu_hash[:url] = "#{x['href']}"
    end
    @menu_hash
  end

  def self.story_scraper(menu_hash)
    @story_hash = {:author => nil, :category => nil, :blurb => nil, :text => nil, :date => nil}
    # gets text and additional story attributes
  end

end
