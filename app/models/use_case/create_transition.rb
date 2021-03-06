module UseCase
  class CreateTransition
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = repository || Repository::Memory::Transition.new
      @repository.listener = self
    end

    def create(attributes)
      if @repository.create(attributes)
        @listener.create_transition_success
      end
    end
  end
end
