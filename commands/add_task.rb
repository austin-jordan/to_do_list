class AddTask
  def self.run(tasks, task)
    tasks << task
  end

  def self.command_string
    'a'
  end

  def self.command_description
    '(a)dd task'
  end
end