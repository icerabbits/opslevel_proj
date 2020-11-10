class ToDoList < ApplicationRecord
  has_many :tasks

  def import(file_path)
    contents = JSON.parse(File.open(file_path).read)
    contents.each do |content|
      name = content["name"]
      description = content["description"]
      priority = content["priority"].present? ? content["priority"].to_i : nil
      self.tasks.create(name: name, description: description, priority: priority)
    end
  end

  def priority_labelled
    return unless self.present?

    self.tasks.where.not(priority: nil).sort_by &:priority
  end

  def missing_priority
    return unless self.tasks.present?

    missingArray = (1..self.tasks.size).to_a
    currentPriority = self.priority_labelled.pluck(:priority)
    return missingArray - currentPriority
  end

  def priority_not_labelled
    return unless self.present?

    self.tasks.where(priority: nil).sort_by &:created_at
  end

end
