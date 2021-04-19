require_relative 'commands/add_task'
require_relative 'commands/change_priority'
require_relative 'commands/delete_task'
require_relative 'commands/null_command'
require_relative 'commands/reset_list'

class Commands
  COMMANDS = [AddTask, DeleteTask, ChangePriority, ResetList]

  def self.command_class_for(command_string)
    command = COMMANDS.find { |command| command.command_string == command_string }
    command || NullCommand
  end

  def self.command_list
    "Available commands: #{AddTask.command_description} #{ChangePriority.command_description} #{DeleteTask.command_description} #{ResetList.command_description}"
  end
end