module UseCase
  class CreatePosition
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = repository || Repository::Memory::Position.new(self)
    end

    def create(attributes)
      if @repository.create(attributes)
        @listener.create_position_success
      end
    end
  end
end
