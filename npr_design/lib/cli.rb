class NprDesign::CLI

  def call
    puts "Welcome to Your NPR News: Art & Design"
    puts ""
    menu
    goodbye
  end

  def menu
    puts "Here are your weekly stories:"
    puts ""
    # Invite user to enter which story they'd like to learn more about
      # Title
      # Category
      # Blurb
    puts "Please enter the corresponding number for your story of interest."
    puts story_1.category = "Fine Art"
    puts story_1.title = "I Love Art"
    puts story_1.blurb = "Find out how cool art is. If you don't know, you better know. Art is the coolest."
    puts story_2.category = "Design"
    puts story_2.title = "Design Is Cool"
    puts story_2.blurb = "You better read this article or you are dumb. This story is life changing, don't miss it, or else."
    # Gets input string-number corresponding to story
    input = gets.strip
    # Display story: Title, Date, Author, Text
    # Options: Quit, Return to Menu
  end

  def goodbye
    # Goodbye
  end

end
