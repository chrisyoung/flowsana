module UseCase
  class CreateFlow
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = repository || Repository::Memory::Flow.new
      @repository.listener = self
    end

    def create(attributes)
      @repository.create(attributes)
    end

    def flow_repository_create_success(flow)
      @listener.create_flow_success(flow)
    end

    def repository_create_flow_failure
      @listener.create_flow_failure
    end
  end
end
