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
    @@all << self
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


  def text_display
    doc = Nokogiri::HTML(open("https://www.npr.org/sections/thesalt/2017/12/24/572719428/gourmet-sprinkles-makes-sweets-and-other-treats-sparkle"))
    text = doc.css("div#storytext.storytext.storylocation.linkLocation").text
    f = Nokogiri::XML.fragment(text)
    f.search("div.credit-caption div.caption-wrap").remove
    puts f

    # remove ("div.credit-caption div.caption-wrap").text
    # remove ("div.enlarge-options button.enlargebtn").text
    # remove ("div.credit-caption div.caption-wrap div.caption p").text
    # revove ("...b.credit").text
    # remove ("div.imagewrap img (src=)")
    # remove ("div.credit-caption div.caption-wrap span.credit").text

    # f = Nokogiri::XML.fragment(str)
    # f.search('.//img').remove
    # puts f
  end

  def save
    @@stories << self
  end

  def self.all
    @@all
  end

end
