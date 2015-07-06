module UseCase
  class GetPositions
    def initialize(listener:, repository: nil)
      @listener = listener
      repository.listener = self if repository
      @repository = (repository || Repository::FlowPosition::Memory.new(listener: self))
    end

    def get(flow:)
      @repository.get(flow: flow)
    end

    def repository_get_success(positions:)
      @listener.get_positions_success(positions)
    end
  end
end
