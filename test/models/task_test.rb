require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "completion adjuts due date forward if not ephemeral" do
    @user = User.new({name: 'me', email: 'test@example.com', password: 'tset'})
    @user.save!
    # FIXME Why is @team.name nil?
    @team = Team.new({lead: user, name: @user.name}) 
    @team.save!
    @task = Task.new({team: @team, is_ephemeral: false, frequency: 7, due_date: DateTime.now, title: 'Call mum', description: '+1 7864367500', creator_id: user.id})
    @task.save!

    @task.is_complete = true
    # after_save validation on task
    days = @task.frequency.to_i
    assert @task.due_date == DateTime.now + days.days
    assert @task.is_complete == false
  end
  
end
