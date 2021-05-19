require 'yaml/store'
require_relative 'task_repository'
require_relative 'commands'

class ToDoList
  TESTING = true
  TEST_COMMANDS = [
    "a buy rice",
    "r",
    "a buy ice cream",
    "a buy eggs",
    "d buy eggs",
    "q"
  ]

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
    puts "Available commands: #{Commands.command_list}"
  end

  def process_command
    Commands.command_for(fetch_input).run(tasks)
  end

  def fetch_input
    if TESTING
      input = TEST_COMMANDS.shift
      puts "Test input: #{input}"
    else
      input = gets.chomp
    end
    input
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
