module UseCase
  class CreateFirstPosition
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = (repository || Repository::Position::Memory).new(self)
    end

    def create(attributes)
      @repository.create(attributes)
    end

    def repository_create_success(position)
      @listener.create_position_success
    end
  end
end
