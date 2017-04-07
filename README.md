# BourbonIntegrator

[![Gem Version](https://badge.fury.io/rb/bourbon_integrator.svg)](http://badge.fury.io/rb/bourbon_integrator)
[![Code Climate](https://codeclimate.com/github/skopciewski/bourbon_integrator/badges/gpa.svg)](https://codeclimate.com/github/skopciewski/bourbon_integrator)
[![Dependency Status](https://gemnasium.com/badges/github.com/skopciewski/bourbon_integrator.svg)](https://gemnasium.com/github.com/skopciewski/bourbon_integrator)

## Assumptions

* joins the [bourbon][bourbon] gem and its components into project dependencies
* provides tasks for assets management
* initialize the base structure

## Installation

Add this line to your application's Gemfile:

    gem 'bourbon_integrator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bourbon_integrator

## Configuration

Through `BourbonIntegrator::Config` class:

```ruby
config = BourbonIntegrator::Config.new(
  "project_css_dir" => "css_dir"            # default: "stylesheets"
  "project_images_dir" => "img_dir"         # default: "images"
  "project_font_dir" => "font_dir"          # default: "fonts"
  "project_assets_verbose" => true          # default: false
  "project_cdn_url" => "http://cdn.net"     # default: nil
  "project_assets_http_path" => "assets"    # default: "/"
  "project_ui_dir" => "ui_dir"              # default: "."
  "project_public_dir" => "pub_dir"         # default: "public"
  "project_sass_dir" => "sass_dir"          # default: "sass"
)
```

## Usage

Add to project's Rakefile:
```ruby
require 'bourbon_integrator'
BourbonIntegrator::Tasks.load(BourbonIntegrator::Config.new)
```

and list available tasks:
```ruby
bundle exec rake -T
# rake bi:clean    # Remove compiled css
# rake bi:compile  # Compile css
# rake bi:init     # Initialize base structure
# rake bi:watch    # Run sass watch
```

## Versioning

See [semver.org][semver]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[semver]: http://semver.org/
[bourbon]: http://bourbon.io/
