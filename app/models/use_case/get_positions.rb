module UseCase
  class GetPositions
    def initialize(listener:, repository: nil)
      @listener = listener
      @repository = (repository || Repository::FlowPosition::Memory.new(listener: self))
    end

    def get(flow:)
      positions = @repository.get(flow: flow)
      if positions
        @listener.get_positions_success(positions)
      end
    end
  end
end
