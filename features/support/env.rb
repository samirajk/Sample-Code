require_relative "../../app/models/job"

require "Capybara"
require "Capybara/cucumber"
require "rspec"


World do
  Capybara.app = ProjectDireWolf

  include Capybara::DSL
  include RSpec::Matchers
end