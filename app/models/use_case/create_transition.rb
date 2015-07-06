module UseCase
  class CreateTransition
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = (repository || Repository::TransitionMemory).new
    end

    def create(attributes)
      if @repository.create(attributes)
        @listener.create_transition_success
      end
    end


  end
end
