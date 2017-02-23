# frozen_string_literal: true
require "test_helper"
require "bourbon_integrator/tasks"

class TasksTest < Minitest::Test
  def test_set_configuration
    BourbonIntegrator::Tasks.load("conf")
    assert_equal "conf", BourbonIntegrator::Tasks.config
  end
end
