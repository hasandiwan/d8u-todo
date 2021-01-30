require 'test_helper'

class Api::TasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "deletion" do
    u = User.create({:name => 'test', :email => 'test@mailinator.com', :password => 'password', :password_confirmation => 'password'})
    u.save!

    t = Team.new({:name => 'unit test', :lead => u})
    t.save!

    task1 = Task.new({:title => 'foo', :description => 'bar', :creator => u})
    task1.save!

    assert(task1(:discaded_at).nil? == true)
    delete tasks_url(task1)
    assert(task1(:discarded_at).nil? == false)
  end
end
