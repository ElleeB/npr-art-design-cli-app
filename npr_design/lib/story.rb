class NprDesign::Story

  attr_accessor :title, :author, :category, :blurb, :text, :date, :url

  @@stories = []

  def initialize(title, author)
    @title = title
    @author = author
    # @category = nil
    # @blurb = nil
    # @text = nil
    # @date = nil
  end

  def save
    @@stories << self
  end

  def self.create_from_collection
  end

  def add_attributes
  end

  def self.all
    @@stories
  end

end
