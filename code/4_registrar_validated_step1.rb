class Student
  MAX_SLOTS = 5

  attr_reader :name, :grade, :teacher
  def initialize(name, grade)
    @name  = name
    @grade = grade
  end

  @@teachers = {
    "Shanahan"  => [],
    "Kovacek"   => [],
    "Streich"   => [],
    "Ankunding" => [],
    "Marks"     => []
  }

  def random_list
    @@teachers.keys.shuffle
  end

  def teachers
    @@teachers
  end

  def assign_teacher
    random_list.each_with_index do |t_name, idx|
      slots = @@teachers[t_name]
      if slots.length < MAX_SLOTS
        @teacher = t_name
        slots << @name
        puts "#{@name} is assigned to #{t_name}"
        puts "#{t_name} now has #{MAX_SLOTS - slots.length} slots left"
        return
      end
      if idx == random_list.length - 1
        raise RuntimeError, "There's no room for #{@name}"
      end
    end
  end
end