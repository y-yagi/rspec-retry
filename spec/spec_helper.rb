require 'rspec'
require 'rspec/retry'
if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('2')
  require "pry-debugger"
else
  require "pry-byebug"
end

RSpec.configure do |config|
  config.verbose_retry = true

  config.around :each, :overridden do |ex|
    ex.run_with_retry retry: 3
  end
end
