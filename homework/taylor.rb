class Outfits
  def initialize
  end

  @@tops= ["blouse", "tank_top", "blazer"]

  @@bottoms = [ "jeans", "slacks", "skirt"] 

  @@shoes= [ "heels", "flats", "wedges", "sneakers"]


  def outfit 
    puts " Today you will wear #{@@tops.sample} and #{@@bottoms.sample} and #{@@shoes.sample}"
  end
end 