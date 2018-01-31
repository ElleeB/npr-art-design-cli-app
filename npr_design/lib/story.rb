class NprDesign::Story

  attr_accessor :title, :author, :category, :blurb, :text, :date, :url

  @@stories = []

  def initialize
    @title = title
    @author = author
    @category = category
    @blurb = blurb
    @text = text
    @date = date
  end

  def save
    @@stories << self
  end

  def self.create_from_collection(stories_array)
    stories_array.each do |story|
      self.title = "#{story[:title]}"
      puts self.title
    end
  end


  def add_attributes
  end

  def self.all
    @@stories
  end

end
