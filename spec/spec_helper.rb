require 'item'
require 'order'

RSpec.configure do |config|
  config.formatter = :documentation
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end
