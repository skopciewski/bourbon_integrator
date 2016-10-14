# encoding: utf-8

# Copyright (C) 2016 Szymon Kopciewski
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
require "fileutils"
require "mustache"

module BourbonIntegrator
  module Command
    class Init < CommandTemplate
      def run
        generate_bourbon_dir
        generate_neat_dir
        generate_bitters_dir
        generate_struct_vars
      end

      def generate_bourbon_dir
        @output.puts "*** Initialize bourbon ***"
        @executor.system "bourbon install --path #{sass_path}"
      end

      def generate_neat_dir
        @output.puts "*** Initialize neat ***"
        @executor.system "cd #{sass_path} && neat install"
      end

      def generate_bitters_dir
        @output.puts "*** Initialize bitters ***"
        @executor.system "bitters install --path #{sass_path}"
      end

      def generate_struct_vars
        return if File.exist?(vars_file_path)
        @output.puts "*** Creating _struct_vars file ***"
        FileUtils.mkdir_p sass_path
        File.open(vars_file_path, "w") do |f|
          f.write render_vars_file
        end
      end

      private

      def render_vars_file
        ::Mustache.render(
          IO.read(default_vars_file_path),
          http_stylesheets_path: http_stylesheets_path,
          http_images_path: http_images_path,
          http_fonts_path: http_fonts_path
        )
      end

      def http_stylesheets_path
        File.join(
          http_base_path,
          @config.fetch("project_css_dir")
        )
      end

      def http_images_path
        File.join(
          http_base_path,
          @config.fetch("project_images_dir")
        )
      end

      def http_fonts_path
        File.join(
          http_base_path,
          @config.fetch("project_font_dir")
        )
      end

      def http_base_path
        File.join(
          @config.fetch("project_cdn_url").to_s,
          @config.fetch("project_assets_http_path")
        )
      end
    end
  end
end
