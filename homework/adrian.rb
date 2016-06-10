class Subject
  def initialize
    @subject = [
        "the arts",
        "drama",
        "rodeo clown education",
        "music"
    ].shuffle[0]

    @camp = [
        "Mishawaka",
        "Sunshine",
        "Chuckwagon",
        "Shark Bait"
    ].shuffle[0]
  end
 
  def camp_selection
    puts "Congratulations, you're attending camp #{@camp} of the #{@subject}!"
  end
end