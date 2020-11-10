class TasksController < ApplicationController

  def create
    @t = ToDoList.find_by(id: params["to_do_list_id"].to_i)
    if params["task"]["name"].present? && params["task"]["description"].present?
      priority = params["task"]["priority"].present? ? params["task"]["priority"].to_i : nil
      @t.tasks.create(name: params["task"]["name"], description: params["task"]["description"],
                      priority: priority)
      @t.save
    end

    redirect_back(fallback_location: 'to_do_list/index')
  end

  def destroy
    Task.find_by(id: params["id"].to_i).destroy!

    redirect_back(fallback_location: 'to_do_list/index')
  end
end
