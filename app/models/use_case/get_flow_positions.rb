module UseCase
  class GetFlowPositions
    def initialize(listener:, repository: nil)
      @listener = listener
      @repository = repository || Repository::FlowPositionMemory.new
    end

    def get(flow:)
      positions = @repository.get(flow: flow)
      if positions
        @listener.get_positions_success(positions)
      end
    end
  end
end
