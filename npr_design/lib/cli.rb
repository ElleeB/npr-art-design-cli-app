require 'date'

class NprDesign::CLI

  def call
    puts "Welcome to Your NPR News: Art & Design"
    puts ""
    menu
    goodbye
  end

  def menu
    puts "Today's date: #{Date.today}"
    puts "Here are your weekly stories:"
    puts ""
    # Invite user to enter which story they'd like to learn more about
      # Title
      # Category
      # Blurb
    puts "Please enter the corresponding number for your story of interest."

    puts NprDesign::Story.all

  end

  def story_details
    # Gets input string-number corresponding to story

    input = gets.strip
    # Display story: Title, Date, Author, Text
    # Options: Quit, Return to Menu
    
  end

  def goodbye
    # Goodbye
  end

end
