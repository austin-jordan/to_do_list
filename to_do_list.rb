# Due date
# Description
# Clear list
# Prevent duplicate tasks
require 'yaml/store'

class TaskRepository
  def self.read_all
    store = YAML::Store.new "tasks.yaml"
    tasks = nil
    store.transaction do
      tasks = store["tasks"] || []
    end
    tasks
  end

  def self.save(tasks)
    store = YAML::Store.new "tasks.yaml"
    store.transaction do
      store["tasks"] = tasks
    end
  end
end

class ToDoList
  def main
    store = YAML::Store.new "tasks.yaml"
    tasks = TaskRepository.read_all

    while true
      puts
      puts "-- Tasks --"
      puts tasks
      puts
      puts "-- Available commands --"
      puts "(a)dd"
      puts "(c)hange priority"
      puts "(d)elete"
      puts "(r)eset"
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
      elsif command == "r"
        tasks.clear
      end
      TaskRepository.save(tasks)
    end
  end

end

to_do_list = ToDoList.new()
to_do_list.main