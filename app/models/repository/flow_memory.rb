module Repository
  class FlowMemory
    def initialize(listener)
      @listener = listener
      @list     = []
    end

    def create(attributes)
      ::Flow.new(attributes).tap do |flow|
        if flow.valid?
          @list << flow
          @listener.repository_create_success
        else
          @listener.repository_create_failure
        end
      end
    end

    def count
      @list.count
    end

    def first
      @list.first
    end
  end
end
