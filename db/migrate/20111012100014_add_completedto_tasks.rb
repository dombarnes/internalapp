class AddCompletedtoTasks < ActiveRecord::Migration
  def up
    add_column :tasks, :completed, :boolean
  end

  def down
  end
end
