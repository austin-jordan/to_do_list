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
  if input[0] == "a"
    tasks << input[2..-1]
  else
    tasks.delete(input[2..-1])
  end
  puts
  puts "-- Tasks --"
  puts tasks
  puts
end
