class Menu
  def initialize(main, dessert)
    @main  = main
    @dessert = dessert
  end

  @@main = [
    "pasta",
    "pizza"
  ]

  @@dessert = [
    "cake",
    "pie" 
  ]

  def full_meal
    if !@@main.include?(@main)
      puts "You can't order that"
      return
    end

    puts "You're eating #{@main} and #{@dessert}"
  end

  def all_options
    puts "You can have #{@@main[0]} or #{@@main[1]} as main dishes"
  end
end