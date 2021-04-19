class AddTask
  def self.run(tasks, task)
    tasks << task
  end

  def self.command_string
    'a'
  end
end