# Priority
# Due date
# Mark as completed
# Description
tasks = []
while true
  puts "Available commands: (a)dd (d)elete"
  input = gets.chomp
  tasks << input[2..-1]
  puts
  puts "-- Tasks --"
  puts tasks
  puts
end
