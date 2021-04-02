# Due date
# Description
# Clear list
# Prevent duplicate tasks
tasks = []
while true
  puts "Available commands: (a)dd task"
  input = gets.chomp
  if input[0] == "a"
    tasks << input[2..-1]
  end
  puts
  puts "-- Tasks --"
  puts tasks
  puts
end