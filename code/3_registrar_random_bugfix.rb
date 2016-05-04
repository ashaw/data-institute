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

  def random_list
    @@teachers.keys.shuffle
  end

  def assign_teacher
    random_list.each_with_index do |t_name, idx|
      slots = @@teachers[t_name]
      if slots > 0
        @teacher = t_name
        @@teachers[t_name] -= 1
        puts "#{@name} is assigned to #{t_name}"
        puts "#{t_name} now has #{slots - 1} slots left"
        return
      end
      if idx == random_list.length - 1
        puts "There's no room for #{@name}"
      end
    end
  end
end
