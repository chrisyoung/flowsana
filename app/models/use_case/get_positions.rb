module UseCase
  class GetPositions
    def initialize(listener, repository = nil)
      @listener            = listener
      @repository          = (repository || Repository::Memory::Position).new(self)
    end

    def all
      @repository.list
    end

    def repository_get_success(positions)
      @listener.get_positions_success(positions)
    end
  end
end
