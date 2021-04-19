require 'yaml/store'
require_relative 'task_repository'
require_relative 'commands'

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
    puts Commands.command_list
  end

  def process_command
    input = gets.chomp
    command = input[0]
    command_class = Commands.command_class_for(command)
    task = input[2..-1]
    command_class.run(tasks, task)
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
