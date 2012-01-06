require 'spec_helper'

module MavenPom
  describe Sorter do
    let(:poms) {
      [
        mock(Pom,
          :key => "no.finntech:control",
          :dependencies => ["no.finntech:kernel", "no.finntech:base"],
          :parent => nil
        ),
        mock(Pom,
          :key => "no.finntech:kernel",
          :dependencies => [],
          :parent => "no.finntech:iad"
        ),
        mock(Pom,
          :key => "no.finntech:base",
          :dependencies => ["no.finntech:kernel"],
          :parent => "no.finntech:iad"
        ),
        mock(Pom,
          :key => "no.finntech:iad",
          :dependencies => [],
          :parent => nil
        )
      ].each { |e| e.stub(:build_plugins => []) }
    }

    it "does a topological sort of the given maven modules" do
      sorted = Sorter.new(poms).sort.map { |e| e.key }

      sorted.should == [
        "no.finntech:iad",
        "no.finntech:kernel",
        "no.finntech:base",
        "no.finntech:control"
      ]
    end

  end
end


