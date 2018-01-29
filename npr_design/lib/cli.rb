class NprDesign::CLI

  def call
    puts "Welcome to Your NPR News: Art & Design"
    puts ""
    menu
    story_details
  end

  def menu
    puts "Today's date: #{Date.today}"
    puts "Here are your weekly stories:"
    puts ""

    NprDesign::Story.all.each.with_index(1){|x, i| puts "#{i}. #{x}"}

  end

  def story_details
    # Invite user to enter which story they'd like to learn more about
    puts "Please enter the corresponding number for your story of interest."

    # Gets input string-number corresponding to story
    input = gets.strip
    if valid?
      if input > 0
        #story_instance.text_display
      elsif input == "menu"
        menu
      elsif input == "exit"
        goodbye
      end
    else
      puts "Please enter a valid number"
    end
  end

  def valid?(input)
  end

  def goodbye
    # Goodbye
  end

end
