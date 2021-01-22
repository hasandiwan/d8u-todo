class AddAutorenewToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :frequency, :integer, default: -1
    add_column :tasks, :is_ephemeral, :boolean, default: false
  end
end
