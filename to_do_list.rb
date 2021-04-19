require 'yaml/store'
require_relative 'task_repository'
require_relative 'commands/add_task'
require_relative 'commands/change_priority'
require_relative 'commands/delete_task'
require_relative 'commands/null_command'
require_relative 'commands/reset_list'

class ToDoList
  COMMANDS = [AddTask, DeleteTask, ChangePriority, ResetList]

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
    command_class = command_class_for(command)
    task = input[2..-1]
    command_class.run(tasks, task)
  end

  def command_class_for(command_string)
    command = COMMANDS.find { |command| command.command_string == command_string }
    command || NullCommand
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
