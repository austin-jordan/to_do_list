# Priority
# Due date
# Mark as completed
# Description
tasks = []
while true
  puts "Available commands: (a)dd (d)elete"
  print "> "
  input = gets.chomp
  system "clear"
  tasks << input[2..-1]
  puts
  puts "-- Tasks --"
  puts tasks
  puts
end
