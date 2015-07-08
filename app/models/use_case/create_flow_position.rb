module UseCase
  class CreateFlowPosition
    attr_accessor :repository
    def initialize(listener:, repository: nil)
      @listener   = listener
      @repository = (repository || Repository::FlowPositionMemory).new
    end

    def create(attributes)
      if repository.create(attributes: attributes)
        @listener.create_flow_position_success(self)
      end
    end
  end
end