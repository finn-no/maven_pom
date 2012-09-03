require 'spec_helper'

module MavenPom
  describe Pom do
    let(:pom_module) { Pom.new fixture("pom.xml"), "some/pom/path/pom.xml" }
    let(:war_module) { Pom.new fixture("war.xml"), "some/war/path/pom.xml" }
    let(:child_module) { Pom.new fixture("child.xml"), "some/child/path/pom.xml" }

    it "knows the module's packaging" do
      pom_module.packaging.should == 'pom'
      war_module.packaging.should == 'war'
    end

    it "knows the module's dependencies" do
      pom_module.dependencies.should == [
        "com.example:example-dep-1",
        "com.example:example-dep-2" # uses ${project.groupId}
      ]
    end

    it "knows the module's parent" do
      child_module.parent.should == pom_module.key
      child_module.parent_pom.should == pom_module
    end

    it "knows the module's build plugins" do
      child_module.build_plugins.should == [
        "org.apache.maven.plugins:maven-source-plugin",
        "org.apache.maven.plugins:maven-javadoc-plugin",
        "org.apache.maven.plugins:maven-deploy-plugin"
      ]
    end

    it "knows the group_id and artifact_id" do
      war_module.group_id.should == "com.example"
      war_module.artifact_id.should == "example-war"
    end

    it "finds the parent's group_id if none is specified" do
      child_module.group_id.should == "com.example"
      child_module.artifact_id.should == "child"
    end

    it "has a key" do
      war_module.key.should == "com.example:example-war"
    end
  end
end
