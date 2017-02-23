# frozen_string_literal: true
require "test_helper"
require "bourbon_integrator"

class BourbonIntegratorTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::BourbonIntegrator::VERSION
  end
end
