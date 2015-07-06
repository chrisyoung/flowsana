module UseCase
  class CreateFlowPosition
    attr_accessor :repository
    def initialize(listener:, repository: nil)
      @listener   = listener
      @repository = (repository || Repository::FlowPosition::Memory).new(listener: self)
    end

    def create(attributes)
      repository.create(attributes: attributes)
    end

    def repository_create_success
      @listener.create_flow_position_success(self)
    end
  end
end
