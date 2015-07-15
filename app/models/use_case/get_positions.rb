module UseCase
  class GetPositions

    def initialize(listener, repository = nil)
      @listener            = listener
      @repository          = repository || Repository::Memory::Position.new
      @repository.listener = self
    end

    def get
      @repository.all
    end

    def position_repository_all_success(positions)
      @listener.get_positions_success(positions)
    end
  end
end
