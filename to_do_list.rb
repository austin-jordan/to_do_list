class ToDoList

  def main
    tasks = []
    while true
      puts '-- Tasks --'
      puts tasks
      puts "Available commands -- (a)dd task"
      input = gets.chomp
      command = input[0]
      task = input[1..-1]
      if command == 'a'
        tasks << task
      end
    end
  end



end

to_do_list = ToDoList.new
to_do_list.main