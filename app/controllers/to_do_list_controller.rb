class ToDoListController < ApplicationController
  def index
    @t = ToDoList.first
  end

  def load_sample_data
    @t = ToDoList.create
    @t.import('sample_data.json')

    redirect_back(fallback_location: 'to_do_list/index')
  end

  def update_priority
    @t = ToDoList.find_by(id: params["to_do_list_id"].to_i)
    params["task"].each do |key, value|
      task = Task.find_by(id: key.to_i)
      newPriority = value["priority"].to_i
      if @t.missing_priority.include?(newPriority)
        task.update(priority: newPriority)
        task.save
      end
    end

    redirect_back(fallback_location: 'to_do_list/index')
  end

end
