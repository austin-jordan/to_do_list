class AddTask
  def self.run(tasks, task)
    tasks << task
  end
  #use class name to create command list
  def self.command_string
    'a'
  end

  def self.command_description
    '(a)dd task'
  end
end