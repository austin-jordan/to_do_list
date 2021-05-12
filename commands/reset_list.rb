require_relative 'command'

class ResetList < Command
  def do_run(tasks, _task)
    tasks.clear
  end

  def self.match?(command_text)
    command_text[0] == 'r'
  end

  def self.command_description
    '(r)eset list'
  end
end