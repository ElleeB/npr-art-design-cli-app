class NprDesign::Story

  attr_accessor :title, :author, :category, :blurb, :text, :date

  @stories = []

  def initialize
  end

  def self.create_from_collection
  end

  def add_attributes
  end

  def menu_display
  end

  def text_display
  end


  def self.all

    # @stories

    story_1 = self.new
    story_1.category = "Fine Art"
    story_1.title = "I Love Art"
    story_1.blurb = "Find out how cool art is. If you don't know, you better know. Art is the coolest."

    story_2 = self.new
    story_2.category = "Design"
    story_2.title = "Design Is Cool"
    story_2.blurb = "You better read this article or you are dumb. This story is life changing, don't miss it, or else."

    [story_1, story_2]
  end

end
