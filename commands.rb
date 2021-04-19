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
end