require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "minitest/autorun"
require "minitest/reporters"

require "stringio"
require "support/fake_executor"
require "support/rubygems_fix_00"

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

module TestHelper
  TESTS_DIR = File.expand_path(File.dirname(__FILE__))
  SUPPORT_DIR = File.join TESTS_DIR, "support"
end
