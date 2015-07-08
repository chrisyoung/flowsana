module UseCase
  class GetFlowPositions
    def initialize(listener:, repository: nil)
      @listener = listener
      @repository = repository || Repository::Memory::FlowPosition.new
      @repository.listener = self
    end

    def get(flow:)
      positions = @repository.get(flow: flow)
      if positions
        @listener.get_positions_success(positions)
      end
    end
  end
end
