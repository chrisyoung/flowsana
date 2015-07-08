module UseCase
  class GetPositions

    def initialize(listener:, repository: nil)
      @listener            = listener
      @repository          = repository || Repository::PositionMemory.new
      @repository.listener = self
    end

    def get
      @repository.get
    end

    def repository_get_success(positions)
      @listener.get_positions_success(positions)
    end
  end
end
