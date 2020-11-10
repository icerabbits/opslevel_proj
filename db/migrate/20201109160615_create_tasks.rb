class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :to_do_lists do |t|
      t.string :name
      t.timestamps
    end

    create_table :tasks do |t|
      t.belongs_to :to_do_list
      t.string :name
      t.string :description
      t.integer :priority

      t.timestamps
    end
  end
end
