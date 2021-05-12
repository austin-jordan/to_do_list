require_relative 'command'

class NullCommand < Command
  def self.match?(command_text)
    true
  end

  def self.command_description
    ""
  end

  def do_run(_tasks, _task)
    # No-Op
  end
end