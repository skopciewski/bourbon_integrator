# frozen_string_literal: true
require "test_helper"
require "bourbon_integrator/config"

class ConfigTest < Minitest::Test
  def setup
    @config = BourbonIntegrator::Config.new
  end

  def test_default_config_is_valid
    assert @config.valid?
  end

  def test_configuration_has_default_project_css_dir_value
    assert_equal "stylesheets", @config.fetch("project_css_dir")
  end

  def test_configuration_has_default_project_images_compressed_dir_value
    assert_equal "images", @config.fetch("project_images_dir")
  end

  def test_configuration_has_default_project_assets_verbose_value
    refute @config.fetch("project_assets_verbose")
  end

  def test_configuration_has_default_project_cdn_url_value
    assert_nil @config.fetch("project_cdn_url")
  end

  def test_configuration_has_default_project_font_dir_value
    assert_equal "fonts", @config.fetch("project_font_dir")
  end

  def test_configuration_has_default_project_assets_http_path_value
    assert_equal "/", @config.fetch("project_assets_http_path")
  end

  def test_configuration_has_default_project_ui_dir_value
    assert_equal ".", @config.fetch("project_ui_dir")
  end

  def test_configuration_has_default_project_public_dir_value
    assert_equal "public", @config.fetch("project_public_dir")
  end

  def test_configuration_has_default_project_sass_dir_value
    assert_equal "sass", @config.fetch("project_sass_dir")
  end
end
