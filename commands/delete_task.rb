require_relative 'command'

class DeleteTask < Command
  def do_run(tasks, task)
    tasks.delete(task)
  end

  def self.command_string
    'd'
  end

  def self.command_description
    '(d)elete task'
  end
end
