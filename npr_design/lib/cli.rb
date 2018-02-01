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
    menu_url = "https://www.npr.org/sections/art-design/" # is there a different way to do this?
    stories_array = NprDesign::Scraper.menu_scraper(menu_url) # how to get url here
    NprDesign::Story.create_from_collection(stories_array)
  end

  def add_attributes
    NprDesign::Story.all.each do |story|
      story.add_text_and_author
    end
  end

  def menu
    puts "Today's date: #{Date.today}"
    puts "Here are your weekly stories:"
    puts ""
    NprDesign::Story.all.each.with_index(1) do |x, i| # display_menu_items
      puts "#{i}. #{x.title}"
      puts "#{x.category}" #some not listing category - do some not have a category?
      puts "#{x.blurb}"
    end
  end

  def display_menu_items
    ### make menu pretty
  end

  def story_text
    # Invite user to enter which story they'd like to learn more about and display text
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
