module UseCase
  class TransitionFromManyPositionsToOne
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = repository || Repository::Memory::Transition.new
      @repository.listener = self
      @transitions = []
    end

    def transition(from, to)
      from.each do |from_id|
        @repository.create(from: from_id, to: to)
      end
      @listener.transition_from_many_positions_to_one_success(@transitions)
    end

    def transition_repository_create_success(transition)
      @transitions << transition
    end

    def transition_repository_create_failure
      @listener.transition_from_many_positions_to_one_failure
    end
  end
end
