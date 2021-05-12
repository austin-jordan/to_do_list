require_relative 'command'

class AddTask < Command
  def do_run(tasks, task)
    tasks << task
  end
  #use class name to create command list
  def self.match?(command_text)
    command_text[0] == 'a'
  end

  def self.command_description
    '(a)dd task'
  end
end