class AddAutorenewToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :frequency, :integer, default: 0
  end
end
