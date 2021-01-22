require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "completion adjuts due date forward if not ephemeral" do
    @user = User.new
    @user.name = 'Team'
    @user.email = 'team@example.com'
    @user.password = 'foo'
    @user.save

    @team = Team.new()
    @team.lead_id = @user.id
    @team.name = "foo"
    @team.save

    Task.destroy_all
    @task = Task.new()
    @task.team = Team.first
    @task.frequency = 7
    @task.due_date = due = Date.today
    @task.title = 'Call mum'
    @task.description = 'tel:+17864367500'
    @task.creator = User.first
    @task.save!

    @task.completed = true

    assert @task.due_date.to_date == Date.today + 7.days
  end
  
end
