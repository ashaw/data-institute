class Dog
  def initialize(name, sound)
    @name = name
    @sound = sound
  end

  def bark
    puts "#{@name} says #{@sound}"
  end
end