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
      story.add_attributes
    end
  end

  def menu
    # puts "Today's date: #{Date.today}"
    puts "Here are your weekly stories:"
    puts ""
    NprDesign::Story.all.each.with_index(1) do |x, i| # display_menu_items
      puts "#{i}. #{x.title}"
      puts ""
      puts "#{x.category}" ### !!! some not listing category - do some not have a category? !!! ### ex. 13. Exhibit Featuring 20 Red Punching Bags Opens At LA Art Show
      puts ""
      puts "#{x.blurb}"
      puts ""
      puts ""
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
    #if valid? (is this necessary?)
    if input.to_i > 0
      ### display_story ###
      story = NprDesign::Story.all[input.to_i - 1]
      puts "#{story.title}, #{story.author}"
      puts ""
      puts story.text.gsub("#{story.credits}", "")
      puts ""
      puts story.credits
    elsif input == "menu"
      menu
    elsif input == "exit"
      puts goodbye
    end

    def display_story
      # try to make the reading/text return pretty

      # student scraper example:
      #   Student.all.each do |student|
      #     puts "#{student.name.upcase}".colorize(:blue)
      #     puts "  location:".colorize(:light_blue) + " #{student.location}"
      #     puts "  profile quote:".colorize(:light_blue) + " #{student.profile_quote}"
      #     puts "  bio:".colorize(:light_blue) + " #{student.bio}"
      #     puts "  twitter:".colorize(:light_blue) + " #{student.twitter}"
      #     puts "  linkedin:".colorize(:light_blue) + " #{student.linkedin}"
      #     puts "  github:".colorize(:light_blue) + " #{student.github}"
      #     puts "  blog:".colorize(:light_blue) + " #{student.blog}"
      #     puts "----------------------".colorize(:green)
      #   end

      # end
    end

  # else
  #   puts "Please enter a valid number"
  # end

  end

  def valid?(input) # necessary?
  end

  def goodbye
    "Goodbye! Thanks for reading."
  end

end
