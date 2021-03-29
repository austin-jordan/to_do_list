require 'yaml/store'

class TaskRepository
  def self.read_all
    tasks = nil
    store.transaction do
      tasks = store["tasks"] || []
    end
    tasks
  end

  def self.save(tasks)
    store.transaction do
      store["tasks"] = tasks
    end
  end

  def self.store
    @store ||= YAML::Store.new("tasks.yaml")
  end
end