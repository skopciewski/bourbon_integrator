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

require "piko_model"

module BourbonIntegrator
  class Config < PikoModel::Model
    field "project_css_dir", default: "stylesheets"
    field "project_images_dir", default: "images"
    field "project_font_dir", default: "fonts"
    field "project_assets_verbose", default: false
    field "project_cdn_url", default: nil
    field "project_assets_http_path", default: "/"
    field "project_ui_dir", default: "."
    field "project_public_dir", default: "public"
    field "project_sass_dir", default: "sass"
  end
end
