module UseCase
  class TransitionFromOnePositionToMany
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = repository || Repository::Memory::Transition.new
      @repository.listener = self
    end

    def transition
      @repository.create
    end

    def transition_repository_create_success(transition)
      @listener.transition_from_one_position_to_many_success(transition)
    end

    def transition_repository_create_failure
      @listener.transition_from_one_position_to_many_failure
    end
  end
end
