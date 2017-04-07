# frozen_string_literal: true

# Copyright (C) 2017 Szymon Kopciewski
#
# This file is part of BourbonIntegrator.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

module BourbonIntegrator
  class CommandTemplate
    def initialize(config:, output: $stdout, executor: ::Kernel)
      @config = config
      @output = output
      @executor = executor
    end

    def run
      raise NotImplementedError
    end

    private

    def sass_path
      File.join(
        Rake.application.original_dir,
        @config.fetch("project_ui_dir"),
        @config.fetch("project_sass_dir")
      )
    end

    def sass_style
      @config.fetch("project_assets_verbose") ? "nested" : "compressed"
    end

    def sourcemap
      "--sourcemap=none" unless @config.fetch("project_assets_verbose")
    end

    def stylesheets_path
      File.join(
        @config.fetch("project_ui_dir"),
        @config.fetch("project_public_dir"),
        @config.fetch("project_css_dir")
      )
    end

    def vars_file_path
      File.join(
        sass_path,
        "_struct_vars.scss"
      )
    end

    def default_vars_file_path
      File.join(
        Gem.datadir("bourbon_integrator"),
        "struct_vars.scss.mustache"
      )
    end
  end
end
