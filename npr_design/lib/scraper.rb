class NprDesign::Scraper

  def self.menu_scraper(menu_url)
    # gets title, author, story.url
    doc = Nokogiri::HTML(open(menu_url))
    stories = doc.css("div.item-info")
    @story_url = stories.css("h2.title a")[0]
    #=> returns titles of stories
  end

  def self.story_scraper(story_url)
    # story.url
    # gets text and additional story attributes
  end

end

# @story_url = stories.css("h2.title").css("a").text
  #=> returns titles of stories

# @story_url = stories.css("h2.title a")[0]
  #=> #<Nokogiri::XML::Element:0x3ff7bb09a1a8 name="a" attributes=[#<Nokogiri::XML::Attr:0x3ff7bb097b24
  # name="href" value="https://www.npr.org/2018/01/28/581006370/at-one-nasa-lab-art-and-science-share-the-same-orbit">,
  # #<Nokogiri::XML::Attr:0x3ff7bb097a98 name="data-metrics" value="{\"action\":\"Click Featured Story Headline 1-3\",\"category\":\"Aggregation\"}">]
  # children=[#<Nokogiri::XML::Text:0x3ff7bb096684 "At One NASA Lab, Art And Science Share The Same Orbit">]
