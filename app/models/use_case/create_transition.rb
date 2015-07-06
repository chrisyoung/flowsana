module UseCase
  class CreateTransition
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = (repository || Repository::TransitionMemory).new(self)
    end

    def create(attributes)
      @repository.create(attributes)
    end

    def repository_create_success
      @listener.create_transition_success
    end

  end
end
