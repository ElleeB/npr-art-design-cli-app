class NprDesign::Story

  attr_accessor :title, :author, :category, :blurb, :text, :credits, :url

  @@all = []

  def initialize # make this prettier
  # def initialize(params)
  #   params.each do |key, value|
  #     instance_variable_set("@#{key}", value)
  #   end
  # end
    @title = title, @text = text
    @author = author
    @category = category
    @blurb = blurb
    @text = text
    @credits = credits
    @url = url
    self.save
  end

  def self.create_from_collection(stories_array)
    stories_array.each do |story| ### can .send help me here? ###
      new_story = NprDesign::Story.new
      new_story.title = story[:title]
      new_story.category = story[:category] ### !!! if no category, nil !!! ###
      new_story.blurb = story[:blurb]
      new_story.credits = story[:credits]
      new_story.url = story[:url]
    end
  end

  def add_attributes ### !!! no author showing up when display text via cli !!! ###
    #adds author, text, and credits
    doc = Nokogiri::HTML(open(self.url))
    #remove unwanted elements
    f = Nokogiri::XML.fragment(doc) ### can this be wrapped up? ###

      f.search("div.credit-caption div.caption-wrap").remove
      f.search("div.enlarge-options button.enlargebtn").remove
      f.search("div.credit-caption div.caption-wrap div.caption p").remove
      f.search("div.credit-caption div.caption-wrap div.caption p b.credit").remove
      f.search("div.imagewrap img src").remove
      f.search("div.credit-caption div.caption-wrap span.credit").remove
      f.search("aside#ad-standard-wrap").remove

    self.text = f.css("div#storytext.storytext.storylocation.linkLocation p").text
    self.author = doc.css("div.byline a").text.strip ### !!! if no author, nil !!! ###
    self.credits = f.css("div.bucket p").text
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
