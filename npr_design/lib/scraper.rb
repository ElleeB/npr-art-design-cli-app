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

  def self.text_scraper(story_url)
    doc = Nokogiri::HTML(open(story_url))
    #remove unwanted elements
    f = Nokogiri::XML.fragment(doc)
    f.search("div.credit-caption div.caption-wrap").remove
    f.search("div.enlarge-options button.enlargebtn").remove
    f.search("div.credit-caption div.caption-wrap div.caption p").remove
    f.search("div.credit-caption div.caption-wrap div.caption p b.credit").remove
    f.search("div.imagewrap img src").remove
    f.search("div.credit-caption div.caption-wrap span.credit").remove

    @text = f.css("div#storytext.storytext.storylocation.linkLocation p").text
  end
  @text
end
