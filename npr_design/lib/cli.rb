class NprDesign::CLI

  def call
    puts "Welcome to Your NPR News: Art & Design Edition"
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
    puts ""
    puts "Please enter the corresponding number for your story of interest, 'menu' to return to the story menu, or 'exit' to exit the program."

    # Gets input string-number corresponding to story
    input = gets.strip

    #if valid?

    if input.to_i > 0
      puts "Storytime!"#story_instance.text_display
    elsif input == "menu"
      call
      #=> Today's date: 2018-01-29
        # Here are your weekly stories:
        # 1. #<NprDesign::Story:0x007f92d206da80>
        # 2. #<NprDesign::Story:0x007f92d206d738>
        # 3. #<NprDesign::Story:0x007f92d206c8b0>
        # 4. #<NprDesign::Story:0x007f92d206c798>
    elsif input == "exit"
      puts goodbye
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
