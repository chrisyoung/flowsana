module UseCase
  class ListTransitionsFor
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = repository || Repository::Memory::Transition.new
      @repository.listener = self
    end

    def list(position)
      @repository.list(position)
    end

    def transition_repository_list_success(transition)
      @listener.list_transitions_for_success(transition)
    end

    def transition_repository_list_failure
      @listener.list_transitions_for_failure
    end
  end
end
