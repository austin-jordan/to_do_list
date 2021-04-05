# Due date
# Description
# Clear list
# Prevent duplicate tasks
require 'yaml/store'
require_relative 'task_repository'

class ToDoList
  def main
    tasks = TaskRepository.read_all
    while true
      puts "Available commands: (a)dd task (c)hange priority (d)elete task"
      input = gets.chomp
      command = input[0]
      task = input[2..-1]
      if command == "a"
        tasks << task
      elsif command == "d"
        tasks.delete(task)
      elsif command == "c"
        puts "What priority do you want to give it"
        priority_input = gets.chomp
        tasks.delete_at(tasks.index(task))
        tasks.insert(priority_input.to_i - 1, task)
      end
      puts
      puts "-- Tasks --"
      puts tasks
      puts
      TaskRepository.save(tasks)
    end
  end
end

to_do_list = ToDoList.new()
to_do_list.main