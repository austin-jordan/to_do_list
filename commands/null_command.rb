require_relative 'command'

class NullCommand < Command
  def self.run(_tasks, _task)
    # No-Op
  end
end