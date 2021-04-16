class ToDoList

  def main
    tasks = []
    while true
      puts '-- Tasks --'
      puts tasks
      puts "Available commands -- (a)dd task (c)hange priority (d)elete task"
      input = gets.chomp
      command = input[0]
      task = input[1..-1]
      if command == 'a'
        tasks << task
      elsif command == 'c'
        puts "What priority would you like to give this task?"
        priority_input = gets.chomp
        tasks.delete(task)
        tasks.insert(priority_input.to_i - 1, task)
      elsif command == 'd'
        tasks.delete(task)
      end
    end
  end



end

to_do_list = ToDoList.new
to_do_list.main