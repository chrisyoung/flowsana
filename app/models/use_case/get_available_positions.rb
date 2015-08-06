module UseCase
  class GetAvailablePositions
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = (repository || Repository::Memory::AvailablePosition).new(self)
    end

    def get(position)
      @repository.all position
    end

    def available_position_repository_all_success(to_positions, from_positions)
      @listener.get_available_positions_success to_positions, from_positions
    end

    def available_position_repository_get_failure
      @listener.get_available_positions_failure
    end
  end
end
