require 'maven_pom'

module SpecHelper
  def fixture(name)
    File.read File.expand_path("../fixtures/#{name}", __FILE__)
  end
end

RSpec.configure do |c|
  c.include(SpecHelper)
end