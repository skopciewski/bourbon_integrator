require "test_helper"
require "bourbon_integrator/command/compile"
require "bourbon_integrator/config"

class CompileTest < Minitest::Test
  def setup
    @config = BourbonIntegrator::Config.new
    @output = StringIO.new
    @executor = FakeExecutor.new
    @command_args = { output: @output, executor: @executor, config: @config }
  end

  def test_run_comman_puts_output
    BourbonIntegrator::Command::Compile.new(@command_args).run
    @output.rewind
    assert_equal 1, @output.each_line.count
  end

  def test_run_comman_call_system
    BourbonIntegrator::Command::Compile.new(@command_args).run
    assert_match(
      %r{^sass -r sass-globbing --scss --style compressed --sourcemap=none --update .*/sass:./public/stylesheets},
      @executor.system_calls.first
    )
  end

  def test_run_comman_with_assets_verbose_use_nested_style
    config = BourbonIntegrator::Config.new project_assets_verbose: true
    BourbonIntegrator::Command::Compile.new(@command_args.merge(config: config)).run
    assert_match(
      %r{^sass -r sass-globbing --scss --style nested\s+--update .*\./sass:./public/stylesheets},
      @executor.system_calls.first
    )
  end
end
