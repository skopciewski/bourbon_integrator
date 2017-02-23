# frozen_string_literal: true
require "test_helper"
require "bourbon_integrator/command/clean"
require "bourbon_integrator/config"

class CleanTest < Minitest::Test
  def setup
    @config = BourbonIntegrator::Config.new
    @output = StringIO.new
    @executor = FakeExecutor.new
    @command_args = { output: @output, executor: @executor, config: @config }
  end

  def test_run_comman_puts_output
    BourbonIntegrator::Command::Clean.new(@command_args).run
    @output.rewind
    assert_equal 1, @output.each_line.count
  end

  def test_run_comman_call_system
    BourbonIntegrator::Command::Clean.new(@command_args).run
    assert_match %r{^rm -rf \./public/stylesheets/\*}, @executor.system_calls.first
  end
end
