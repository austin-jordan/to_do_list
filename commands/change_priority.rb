require_relative 'command'

class ChangePriority < Command
  def do_run(tasks, task)
    puts 'What priority do you want to give it'
    priority_input = gets.chomp
    tasks.delete_at(tasks.index(task))
    tasks.insert(priority_input.to_i - 1, task)
  end

  def self.match?(command_text)
    command_text[0] == 'c'
  end

  def self.command_description
    '(c)hange priority'
  end
end