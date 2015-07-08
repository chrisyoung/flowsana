class UseCase::FindFlow
  def initialize(listener:, repository: nil)
    @listener = listener
    @repository = repository || Repository::Memory::Flow.new(self)
    @repository.listener = self
  end

  def find(flow)
    found_flow = @repository.find(flow)
    positions  = Repository::Memory::FlowPosition.new.get(flow: flow)
    if found_flow
      @listener.find_flow_success(flow: found_flow, positions: positions)
    end
  end
end
