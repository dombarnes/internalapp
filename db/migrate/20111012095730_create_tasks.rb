class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :person_id
      t.string  :task,         :null = false
      t.date    :due_date,      :null = false
      t.string  :category
      t.boolean :private
      t.boolean :completed
      t.timestamps
    end
  end
end
