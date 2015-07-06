module Repository
  class FlowPositionMemory
    attr_accessor :listener

    def initialize(listener: nil)
      @listener = listener
      @list = []
    end

    def create(attributes:)
      @list << ::FlowPosition.new(listener: self, attributes: attributes)
      @listener.repository_create_success if @listener.respond_to?(:repository_create_success)
    end

    def count
      @list.count
    end

    def get(flow:)
      @listener.repository_get_success(positions: flow_positions(flow))
    end

    def flow_positions(flow)
      @list.collect do |flow_position|
        if flow_position.flow == flow
          flow_position.position
        end
      end.compact
    end
  end
end
