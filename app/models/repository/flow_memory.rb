module Repository
  class FlowMemory
    def list
      @list ||= []
    end

    def find(flow)
      list.first do |listed_flow|
        flow == listed_flow
      end
    end

    def create(attributes)
      ::Flow.new(attributes).tap do |flow|
        return unless flow.valid?
        list << flow
      end
    end

    def clear
      @list = []
    end

    def count
      list.count
    end

    def first
      list.first
    end
  end
end