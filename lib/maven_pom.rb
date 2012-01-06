require 'nokogiri'

require "maven_pom/version"
require "maven_pom/error"
require "maven_pom/pom"
require "maven_pom/sorter"

module MavenPom
  def self.from(path)
    Pom.new File.read(path), path
  end

  def sort(poms)
    Sorter.new(poms).sort
  end
end
