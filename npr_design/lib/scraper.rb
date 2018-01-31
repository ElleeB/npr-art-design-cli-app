class NprDesign::Scraper

  def self.menu_scraper(menu_url)
    @stories_array = []
    # gets title, story.url
    doc = Nokogiri::HTML(open(menu_url))
    stories = doc.css("article")
    info = stories.css("div.item-info")

    info.each do |story|
      @menu_hash = {:title => nil, :url => nil, :category => nil, :blurb => nil, :date => nil}
      # @menu_hash[:title} = story.css("h2.title").text
      # @menu_hash[:url} = story.at("p.teaser a")["href"]
      # @menu_hash[:blurb] = story.css("p.teaser").text #minus the first however many characters to remove date
    end

  end


  # def self.story_scraper(stories_array)
  #
  #   # :text => nil,
  #   # :author => nil
  #   # gets text and additional story attributes
  #
  #   stories_array.each do |x|
  #     doc = Nokogiri::HTML(open("https://www.npr.org/2018/01/28/581006370/at-one-nasa-lab-art-and-science-share-the-same-orbit"))
  #     puts doc
  #   end
  # end

end
