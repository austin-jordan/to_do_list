require 'yaml/store'

class TaskRepository
  def self.read_all
    store = YAML::Store.new "tasks.yaml"
    tasks = nil
    store.transaction do
      tasks = store["tasks"] || []
    end
  end

  def self.save(tasks)
    store = YAML::Store.new "tasks.yaml"
    store.transaction do
        store["tasks"] = tasks
      end
  end
end