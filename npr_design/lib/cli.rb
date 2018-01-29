class NprDesign::CLI

  def call
    puts "Welcome to Your NPR News: Art & Design"
    puts ""
    menu
    story_details
    goodbye
  end

  def menu
    puts "Today's date: #{Date.today}"
    puts "Here are your weekly stories:"
    puts ""

    NprDesign::Story.all.each.with_index(1){|x, i| puts "#{i}. #{x}"}

    # Invite user to enter which story they'd like to learn more about
    puts "Please enter the corresponding number for your story of interest."
    story_details
  end

  def story_details
    # Gets input string-number corresponding to story
    input = gets.strip
    puts "#{input} pow!"
    # Display story: Title, Date, Author, Text
    # Options: Quit, Return to Menu
  end

  def valid?(input)
  end

  def goodbye
    # Goodbye
  end

end
