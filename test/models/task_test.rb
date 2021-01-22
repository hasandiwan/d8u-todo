require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "completion adjuts due date forward if not ephemeral" do
    @user = User.new
    @user.name = 'Team'
    @user.email = 'team@example.com'
    @user.password = 'foo'
    @user.save!

    @team = Team.new()
    @team.lead_id = @user.id
    @team.name = "foo"
    @team.save!
    
    @task = Task.new()
    @task.team = @team
    @task.is_ephemeral = false
    @task.frequency = 7
    @task.due_date = due = DateTime.now
    @task.title = 'Call mum'
    @task.description = 'tel:+17864367500'
    @task.creator = @user
    @task.save!

    @task.completed = true
    @task.save!
    puts "#{@task.is_ephemeral} #{@task.due_date.to_date} #{due.to_date + @task.frequency.to_i}"
    assert @task.due_date.to_date == due.to_date + @task.frequency.to_i.days
  end
  
end
