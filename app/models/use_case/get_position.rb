module UseCase
  class GetPosition
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = repository || Repository::Memory::Position.new
      @repository.listener = self
    end

    def get(id)
      @repository.get(id)
    end

    def position_repository_get_success(position)
      @listener.get_position_success(position)
    end

    def position_repository_get_failure
      @listener.get_position_failure
    end
  end
end
