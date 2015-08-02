module UseCase
  class CreateToTransitions
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = (repository || Repository::Memory::Transition).new(self)
    end

    def create(position, to_transitions)
      to_transitions.each do |transition|
        @repository.create(from_id: position.id, to_id: transition[:to])
      end
    end

    def transition_repository_create_success(transition)
      @listener.create_to_transitions_success(transition)
    end

    def transition_repository_create_failure
      @listener.create_to_transitions_failure
    end
  end
end
