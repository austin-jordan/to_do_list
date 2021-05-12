require_relative 'commands/add_task'
require_relative 'commands/change_priority'
require_relative 'commands/command'
require_relative 'commands/delete_task'
require_relative 'commands/null_command'
require_relative 'commands/quit'
require_relative 'commands/reset_list'

class Commands
  COMMANDS = [AddTask, ChangePriority, DeleteTask, ResetList, Quit]

  def self.command_for(input)
    command_string = input[0]
    task = input[2..-1]
    command_class = COMMANDS.find { |command| command.command_string == command_string } || NullCommand
    command_class.new(task)
  end

  def self.command_list
    COMMANDS.map(&:command_description).join(" ")
  end
end