module UseCase
  class UpdatePosition
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = repository || Repository::Memory::Position.new
      @repository.listener = self
    end

    def update(position, attributes)
      @repository.update(position, attributes)
    end

    def position_repository_update_success(position)
      @listener.update_position_success(position)
    end

    def position_repository_update_failure
      @listener.update_position_failure
    end
  end
end
