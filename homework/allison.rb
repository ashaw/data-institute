class Grade
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def score
    puts "#{@name} gets #{@grade}"
  end
end