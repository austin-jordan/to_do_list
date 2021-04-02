# Due date
# Description
# Clear list
# Prevent duplicate tasks
tasks = []
while true
  puts "Available commands: (a)dd task (d)elete task"
  input = gets.chomp
  command = input[0]
  task = input[2..-1]
  if command == "a"
    tasks << task
  elsif command == "d"
    tasks.delete(task)
  end
  puts
  puts "-- Tasks --"
  puts tasks
  puts
end