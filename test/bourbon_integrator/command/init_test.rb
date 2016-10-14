require "test_helper"
require "bourbon_integrator/command/init"
require "bourbon_integrator/config"
require "fileutils"

class GenerateConfigurationTest < Minitest::Test
  def setup
    @test_dir = prepare_test_config_dir
    @config = BourbonIntegrator::Config.new project_ui_dir: "test/tmp"
    @output = StringIO.new
    @executor = FakeExecutor.new
    @command_args = { output: @output, config: @config }
  end

  def teardown
    FileUtils.rm_rf @test_dir
  end

  def test_install_bourbon
    BourbonIntegrator::Command::Init.new(
      @command_args.merge(executor: @executor)
    ).generate_bourbon_dir
    assert_match %r{^bourbon install --path #{@test_dir}/sass}, @executor.system_calls.first
  end

  def test_install_neat
    BourbonIntegrator::Command::Init.new(
      @command_args.merge(executor: @executor)
    ).generate_neat_dir
    assert_match %r{^cd #{@test_dir}/sass && neat install}, @executor.system_calls.first
  end

  def test_install_bitters
    BourbonIntegrator::Command::Init.new(
      @command_args.merge(executor: @executor)
    ).generate_bitters_dir
    assert_match %r{^bitters install --path #{@test_dir}/sass}, @executor.system_calls.first
  end

  def test_run_command_generates_all_struct
    BourbonIntegrator::Command::Init.new(@command_args).run
    bourbon_path = @test_dir.join(@config.fetch("project_sass_dir"), "bourbon")
    assert_equal true, Dir.exist?(bourbon_path)
    neat_path = @test_dir.join(@config.fetch("project_sass_dir"), "neat")
    assert_equal true, Dir.exist?(neat_path)
    bitters_path = @test_dir.join(@config.fetch("project_sass_dir"), "base")
    assert_equal true, Dir.exist?(bitters_path)
    vars_path = @test_dir.join(@config.fetch("project_sass_dir"), "_struct_vars.scss")
    assert_equal true, File.exist?(vars_path)
  end

  private

  def prepare_test_config_dir
    test_dir = Pathname.new(
      File.join(TestHelper::TESTS_DIR, "tmp")
    )
    FileUtils.rm_rf(Dir.glob("#{test_dir}/*")) if test_dir.exist?
    test_dir
  end
end
