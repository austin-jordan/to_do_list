require_relative 'command'

class DeleteTask < Command
  def do_run(tasks, task)
    tasks.delete(task)
  end

  def self.match?(command_text)
    command_text[0] == 'd'
  end

  def self.command_description
    '(d)elete task'
  end
end
