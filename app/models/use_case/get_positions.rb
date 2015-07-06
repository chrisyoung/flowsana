module UseCase
  class GetPositions
    def initialize(listener:, repository: nil)
      @listener = listener
      @repository = repository || Repository::PositionMemory.new
    end

    def get
      positions = @repository.get
      if positions
        @listener.get_positions_success(positions)
      end
    end
  end
end
