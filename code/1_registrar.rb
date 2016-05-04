class Student
  attr_reader :name, :grade, :teacher
  def initialize(name, grade)
    @name  = name
    @grade = grade
  end

  @@teachers = {
    "Shanahan"  => 5,
    "Kovacek"   => 5,
    "Streich"   => 5,
    "Ankunding" => 5,
    "Marks"     => 5
  }

  def assign_teacher
    @@teachers.each do |t_name, slots|
      if slots > 0
        @teacher = t_name
        @@teachers[t_name] -= 1
        puts "#{@name} is assigned to #{t_name}"
        puts "#{t_name} now has #{slots - 1} slots left"
        return
      end
    end
  end
end
