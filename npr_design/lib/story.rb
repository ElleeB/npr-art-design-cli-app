class NprDesign::Story

  attr_accessor :title, :author, :category, :blurb, :text, :url

  @@all = []

  def initialize
    @title = title
    @text = text
    @author = author
    @category = category
    @blurb = blurb
    @text = text
    @url = url
    self.save
  end


  def self.create_from_collection(stories_array)
    stories_array.each do |story|
      new_story = NprDesign::Story.new
      new_story.title = story[:title]
      new_story.category = story[:category]
      new_story.blurb = story[:blurb]
      new_story.url = story[:url]
    end
  end

  def add_text_author
    doc = Nokogiri::HTML(open(self.url))
    # @story_page_hash = {:text => nil, :author => nil}
    #remove unwanted elements
    f = Nokogiri::XML.fragment(doc)
    f.search("div.credit-caption div.caption-wrap").remove
    f.search("div.enlarge-options button.enlargebtn").remove
    f.search("div.credit-caption div.caption-wrap div.caption p").remove
    f.search("div.credit-caption div.caption-wrap div.caption p b.credit").remove
    f.search("div.imagewrap img src").remove
    f.search("div.credit-caption div.caption-wrap span.credit").remove

    self.text = f.css("div#storytext.storytext.storylocation.linkLocation p").text
    self.author = doc.css("p.byline__name byline__name--block").text
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
