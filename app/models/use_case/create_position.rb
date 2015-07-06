module UseCase
  class CreatePosition
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = (repository || Repository::PositionMemory).new(self)
    end

    def create(attributes)
      @repository.create(attributes)
    end

    def repository_create_success(position)
      @listener.create_position_success
    end
  end
end
