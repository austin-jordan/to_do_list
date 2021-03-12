# Change Priority -- Focus on this next
# Due date
# Description
tasks = []
while true
  puts "Available commands: (a)dd (d)elete (c)hange priority"
  print "> "
  input = gets.chomp
  system "clear"
  if input[0] == "a"
    tasks << input[2..-1]
  elsif input[0] == "c"
    puts "What priority do you want to give it?"
    print"> "
    priority_input = gets.chomp
    tasks.insert(priority_input.to_i, tasks.delete_at(tasks.index(input[2..-1])))
  else
    tasks.delete(input[2..-1])
  end
  puts
  puts "-- Tasks --"
  puts tasks
  puts
end
