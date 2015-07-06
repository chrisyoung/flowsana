module UseCase
  class CreateFlow
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = (repository || Repository::Flow::Memory).new
    end

    def create(attributes)
      if @repository.create(attributes)
        @listener.create_flow_success
      else
        @listener.create_flow_failure
      end
    end
  end
end
