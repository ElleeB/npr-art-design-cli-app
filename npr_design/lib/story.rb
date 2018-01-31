class NprDesign::Story

  attr_accessor :title, :author, :category, :blurb, :text, :url

  @@stories = []

  def initialize
    @title = title
    @author = author
    @category = category
    @blurb = blurb
    @text = text
    @url = url
  end

  def save
    @@stories << self
  end

  def self.create_from_collection(stories_array)

  end


  def text_display(url)
    #put this in Scrape class?
  end

  def self.all
    @@stories
  end

end
