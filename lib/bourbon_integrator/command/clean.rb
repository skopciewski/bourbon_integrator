# encoding: utf-8
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

require "bourbon_integrator/command_template"

module BourbonIntegrator
  module Command
    class Clean < CommandTemplate
      def run
        stylesheets_path = File.join(
          @config.fetch("project_ui_dir"),
          @config.fetch("project_public_dir"),
          @config.fetch("project_css_dir")
        )
        @output.puts "*** Remove compiled CSS ***"
        @executor.system "rm -rf #{stylesheets_path}/*"
      end
    end
  end
end
