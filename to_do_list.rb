# Due date
# Description
# Clear list
# Prevent duplicate tasks
require 'yaml/store'

class ToDoList
  def main
    store = YAML::Store.new "tasks.yaml"
    tasks = nil
    store.transaction do
      tasks = store["tasks"] || []
    end

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
      store.transaction do
        store["tasks"] = tasks
      end
    end
  end
end

to_do_list = ToDoList.new()
to_do_list.main