module UseCase
  class CreatePosition
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = repository || Repository::Memory::Position.new
      @repository.listener = self
    end

    def position_repository_create_success(position)
      @listener.create_position_success(position)
    end

    def create(attributes)
      @repository.create(attributes)
    end
  end
end
