require 'json'
require 'faker'
require './6_registrar_final'

(0.upto(24)).each do |i|
  s = Student.new(Faker::Name.name, 8)
  s.assign_teacher
end

File.open("./roll_call.json", "w") do |f|
  f.write Student.roll_call.to_json
end