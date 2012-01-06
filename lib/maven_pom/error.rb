module MavenPom
  class MissingGroupIdError < StandardError
  end

  class CyclicDependencyError < StandardError
  end
end