class NprDesign::Scraper

  @stories_array = []

  def self.menu_scraper(menu_url)
    # gets title, author, story.url
    doc = Nokogiri::HTML(open(menu_url))
    stories = doc.css("h2.title").css("a")
    links = stories.search("a").map{|a| a["href"]}
    links
    #=> returns array of urls
  end

  def self.story_scraper(story_url)
    # story.url
    # gets text and additional story attributes
  end

end

###

# @story_url = stories.css("h2.title").css("a").text
  #=> returns titles of stories

###

# @story_url = stories.css("h2.title a")[0]

  #=> #<Nokogiri::XML::Element:0x3ff7bb09a1a8 name="a" attributes=[#<Nokogiri::XML::Attr:0x3ff7bb097b24
  # name="href" value="https://www.npr.org/2018/01/28/581006370/at-one-nasa-lab-art-and-science-share-the-same-orbit">,

  # #<Nokogiri::XML::Attr:0x3ff7bb097a98 name="data-metrics" value="{\"action\":\"Click Featured Story Headline 1-3\",\"category\":\"Aggregation\"}">]
  # children=[#<Nokogiri::XML::Text:0x3ff7bb096684 "At One NASA Lab, Art And Science Share The Same Orbit">]

###

# doc = Nokogiri::HTML(open(menu_url))
# stories = doc.css("div.item-info")
# links = stories.search("a").collect{|x| x["href"]}
#=>
  # https://www.npr.org/sections/fine-art/
  # https://www.npr.org/2018/01/28/581006370/at-one-nasa-lab-art-and-science-share-the-same-orbit
  # https://www.npr.org/2018/01/28/581006370/at-one-nasa-lab-art-and-science-share-the-same-orbit
  # https://www.npr.org/sections/thetwo-way/
  # https://www.npr.org/sections/thetwo-way/2018/01/26/581038963/national-gallery-cancels-two-upcoming-shows-after-sexual-misconduct-allegations
  # https://www.npr.org/sections/thetwo-way/2018/01/26/581038963/national-gallery-cancels-two-upcoming-shows-after-sexual-misconduct-allegations
  # https://www.npr.org/sections/parallels/
  # https://www.npr.org/sections/parallels/2018/01/25/580109261/connected-to-the-whole-universe-saudi-women-artists-show-their-work-in-the-u-s
  # https://www.npr.org/sections/parallels/2018/01/25/580109261/connected-to-the-whole-universe-saudi-women-artists-show-their-work-in-the-u-s
  # https://www.npr.org/sections/arts/
  # https://www.npr.org/2018/01/26/581142474/alexander-wang-discusses-why-hes-leaving-nyfw-and-his-new-business-model
  # https://www.npr.org/2018/01/26/581142474/alexander-wang-discusses-why-hes-leaving-nyfw-and-his-new-business-model
  # https://www.npr.org/sections/parallels/
  # https://www.npr.org/sections/parallels/2018/01/20/579090994/photos-to-brighten-dreary-winter-n

###

# links = stories.search("a").collect{|x| x.content}
#=>
  # Fine Art
  # At One NASA Lab, Art And Science Share The Same Orbit
  # January 28, 2018  The artists of NASA's Jet Propulsion Laboratories have made travel posters for distant planets, simulated Jupiter's churning atmosphere and translated satellite movements into sound.
  # The Two-Way
  # National Gallery Delays 2 Upcoming Shows After Sexual Misconduct Allegations
  # January 26, 2018  Both artists, Chuck Close and Thomas Roma, have been the subject of recent accusations by multiple women. The museum says it is "not the appropriate time to present these installations."
  # Parallels
  # 'Connected To The Whole Universe': Saudi Women Artists Show Their Work In The U.S.
  # January 25, 2018  The "Women's Point of View" exhibition at the Saudi Embassy in Washington, D.C., includes works of photography, motion graphics, even a design for a lightweight "running abaya" for athletes.
  # Arts & Life
  # Alexander Wang Discusses Why He's Leaving NYFW And His New Business Model
  # January 26, 2018  Fashion designer Alexander Wang recently announced the removal of his collection from New York Fashion Week starting this summer. He shares plans for how he'll sell and show collections going forward.
  # Parallels
  # PHOTOS: To Brighten Dreary Winter Nights, A Festival Lights Up London
  # etc.
