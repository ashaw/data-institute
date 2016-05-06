require 'json'

data = JSON.parse(File.open("roll_call.json").read)
out = ""

# first let's loop through all of the teachers
# to put them in the header row
out << data.keys.join(",") + "\n"

# let's transform the array of arrays from
# [class1student1, class1student2, class1student3],...
# to
# [class1student1, class2student1, class3student1],..

# normally this would be hard, but
# Ruby can do this for us with Array#transpose
column_classrooms = data.values.transpose

# now we just need to stick them in the sheet
column_classrooms.each do |cc|
  out << cc.join(",") + "\n"
end

File.open("roll_call.csv", "w") do |f|
  f.write out
end