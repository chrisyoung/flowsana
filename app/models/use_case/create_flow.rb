module UseCase
  class CreateFlow
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = repository || Repository::Memory::Flow.new
      @repository.listener = self
    end

    def create(attributes)
      flow = @repository.create(attributes)
      if flow
        @listener.create_flow_success(flow)
      else
        @listener.create_flow_failure(flow)
      end
    end
  end
end
