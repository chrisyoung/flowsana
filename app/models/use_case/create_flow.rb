module UseCase
  class CreateFlow
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = (repository || Repository::Flow::Memory).new(self)
    end

    def create(attributes)
      @repository.create(attributes)
    end

    def repository_create_success
      @listener.create_flow_success
    end

    def repository_create_failure
      @listener.create_flow_failure
    end
  end
end
