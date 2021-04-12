require 'yaml/store'
require_relative 'task_repository'

class AddTask

  def self.run(tasks, task)
    tasks << task
  end
end

class DeleteTask
  def self.run(tasks, task)
    tasks.delete(task)
  end
end

class ChangePriority
  def self.run(tasks, task)
    puts 'What priority do you want to give it'
    priority_input = gets.chomp
    tasks.delete_at(tasks.index(task))
    tasks.insert(priority_input.to_i - 1, task)
  end
end

class ResetList
  def self.run(tasks)
    tasks.clear
  end
end

class ToDoList
  def main
    loop do
      clear_screen
      display_tasks
      display_commands
      process_command
      save_tasks
    end
  end

  def clear_screen
    system 'clear'
  end

  def display_tasks
    puts
    puts '-- Tasks --'
    puts tasks
    puts
  end

  def display_commands
    puts 'Available commands: (a)dd task (c)hange priority (d)elete task (r)eset list'
  end

  def process_command
    input = gets.chomp
    command = input[0]
    task = input[2..-1]
    case command
    when 'a'
      AddTask.run(tasks, task)
    when 'd'
      DeleteTask.run(tasks, task)
    when 'c'
      ChangePriority.run(tasks, task)
    when 'r'
      ResetList.run(tasks)
    end
  end

  def save_tasks
    TaskRepository.save(tasks)
  end

  def tasks
    @tasks ||= TaskRepository.read_all
  end
end

to_do_list = ToDoList.new
to_do_list.main
