require 'rgl/adjacency'
require 'rgl/topsort'
require 'rgl/dot'

module MavenPom
  class Sorter
    attr_reader :dag

    def initialize(poms)
      @poms = poms
      build_graph
    end

    def sort
      sorted_keys = @dag.topsort_iterator.to_a.reverse
      sorted_keys.map { |key| @map[key] }.compact
    end

    private

    def build_graph
      @dag = RGL::DirectedAdjacencyGraph.new
      @map = {}

      @poms.each do |pom|
        @map[pom.key] = pom
        @dag.add_vertex(pom.key)
      end

      @dag.vertices.each do |key|
        pom = @map.fetch(key)
        pom.dependencies.each do |dep|
          @dag.add_edge key, dep
        end

        if parent = pom.parent
          @dag.add_edge key, parent
        end

        pom.build_plugins.each do |plugin|
          @dag.add_edge key, plugin
        end
      end

      unless @dag.acyclic?
        raise CyclicDependencyError, "dependency graph has cycles"
      end
    end
  end
end

