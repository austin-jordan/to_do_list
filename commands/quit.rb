require_relative 'command'

class Quit < Command
  def do_run(tasks, task)
    exit
  end

  #use class name to create command list
  def self.command_string
    'q'
  end

  def self.command_description
    '(q)uit'
  end
end