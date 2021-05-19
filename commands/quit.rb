require_relative 'command'

class Quit < Command
  def do_run(tasks, task)
    exit
  end

  #use class name to create command list
  def self.match?(command_text)
    command_text[0] == 'q'
  end

  def self.command_description
    '(q)uit'
  end
end