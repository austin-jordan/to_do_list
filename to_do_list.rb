# Due date
# Description
#
tasks = []
while true
  puts "Available commands: (a)dd (c)hange priority (d)elete"
  print "> "
  input = gets.chomp
  command = input[0]
  task = input[2..-1]
  system "clear"
  if command == "a"
    tasks << task
  elsif command == "c"
    puts "What priority do you want to give it?"
    print"> "
    priority_input = gets.chomp
    new_task_index = priority_input.to_i - 1
    old_task_index = tasks.index(task)
    tasks.delete_at(old_task_index)
    tasks.insert(new_task_index, task)
  elsif command == "d"
    tasks.delete(task)
  end
  puts
  puts "-- Tasks --"
  puts tasks
  puts
end
