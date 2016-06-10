# put in a flower and a color
class Flower
  def initialize(type, color)
    @type = type
    @color = color
  end

  def garden
    puts "#{@type},#{@color}"
  end
end

rows = [
  ["roses", "red"], 
  ["violets", "blue"]
]

puts "type,color"
rows[0..-1].each do |row|
  flower = Flower.new(row[0], row[1])
  flower.garden
end