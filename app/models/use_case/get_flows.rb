module UseCase
  class GetFlows
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener            = listener
      @repository          = repository || Repository::Memory::Flow.new
      @repository.listener = self
    end

    def get
      @repository.all
    end

    def flow_repository_all_success(flows)
      @listener.get_flows_success(flows)
    end

    def flow_repository_all_failure
      @listener.get_flows_success(flows)
    end
  end
end
