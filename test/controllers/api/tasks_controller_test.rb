require 'test_helper'

class Api::TasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "deletion" do
    User.destroy_all
    u = User.create({:name => 'test', :email => 'test@mailinator.com', :password => 'password'})
    u.save!

    Team.destroy_all
    t = Team.new({:name => 'unit test', :lead => u})
    t.save!

    Task.destroy_all
    @task1 = Task.new({:title => 'foo', :description => 'bar', :creator => u, :team => t})
    @task1.save!

    
    assert(@task1.discarded_at.nil? == true)
    @task1.discard!
    assert(@task1.discarded_at.nil? == false)

    assert Task.find(@task1.id).nil? == false
  end
end
