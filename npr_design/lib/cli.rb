class NprDesign::CLI

  def call
    puts "Welcome to Your NPR News: Art & Design Edition"
    puts ""
    run
  end

  def run
    make_stories
    add_attributes
    menu
    story_text
  end

  def make_stories
  end

  def add_attributes
  end

  def menu
    puts "Today's date: #{Date.today}"
    puts "Here are your weekly stories:"
    puts ""
    NprDesign::Story.all.each.with_index(1){|x, i| puts "#{i}. #{x}"}
  end

  def display_menu_items
    ### make menu pretty
  end

  def story_text
    # Invite user to enter which story they'd like to learn more about
    puts ""
    puts "Please enter the corresponding number for your story of interest, 'menu' to return to the story menu, or 'exit' to exit the program."
    # Gets input string-number corresponding to story
    input = gets.strip
    #if valid?
    if input.to_i > 0
      puts "Storytime!" ### display_story ###
    elsif input == "menu"
      menu
    elsif input == "exit"
      puts goodbye
    end

    def display_story
      # try to make the reading/text return pretty
    end

  # else
  #   puts "Please enter a valid number"
  # end

  end

  def valid?(input)
  end

  def goodbye
    "Goodbye! Thanks for reading."
  end

end
