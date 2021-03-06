module UseCase
  class CreateFlowPosition
    attr_accessor :repository

    def initialize(listener:, repository: nil)
      @listener   = listener
      @repository = repository || Repository::Memory::FlowPosition.new
      @repository.listener = self
    end

    def create(flow:, position:)
      repository.create(flow: flow, position: position)
    end

    def repository_create_flow_position_success(flow_position)
      @listener.create_flow_position_success(self)
    end
  end
end
