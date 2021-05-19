class Command < Struct.new(:task)
  def run(tasks)
    do_run(tasks, task)
  end
end