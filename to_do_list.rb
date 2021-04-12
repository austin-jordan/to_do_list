require 'yaml/store'
require_relative 'task_repository'

class ToDoList
  def main
    loop do
      clear_screen
      display_tasks
      display_commands
      process_command
      save_tasks
    end
  end

  def clear_screen
    system 'clear'
  end

  def display_tasks
    puts
    puts '-- Tasks --'
    puts tasks
    puts
  end

  def display_commands
    puts 'Available commands: (a)dd task (c)hange priority (d)elete task (r)eset list'
  end

  def process_command
    input = gets.chomp
    command = input[0]
    task = input[2..-1]
    case command
    when 'a'
      add_task(task)
    when 'd'
      delete_task
    when 'c'
      puts 'What priority do you want to give it'
      priority_input = gets.chomp
      change_priority(priority_input, task)
    when 'r'
      reset_list
    end
  end

  def save_tasks
    TaskRepository.save(tasks)
  end

  def add_task(task)
    tasks << task unless tasks.include?(task)
  end

  def delete_task(task)
    tasks.delete(task)
  end

  def change_priority(priority_input, task)
    tasks.delete_at(tasks.index(task))
    tasks.insert(priority_input.to_i - 1, task)
  end

  def reset_list
    tasks.clear
  end

  def tasks
    @tasks ||= TaskRepository.read_all
  end
end

to_do_list = ToDoList.new
to_do_list.main
