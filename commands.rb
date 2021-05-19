require_relative 'commands/add_task'
require_relative 'commands/change_priority'
require_relative 'commands/command'
require_relative 'commands/delete_task'
require_relative 'commands/null_command'
require_relative 'commands/quit'
require_relative 'commands/reset_list'

class Commands
  COMMANDS = [AddTask, ChangePriority, DeleteTask, ResetList, Quit, NullCommand]

  def self.command_for(command_text)
    task = command_text[2..-1]
    command_class_for(command_text).new(task)
  end

  def self.command_class_for(command_text)
    COMMANDS.find do |command_class|
      command_class.match?(command_text)
    end
  end

  def self.command_list
    COMMANDS.map(&:command_description).join(" ")
  end
end