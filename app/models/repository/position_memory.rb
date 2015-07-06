module Repository
  class PositionMemory
    def initialize(listener)
      @listener = listener
      @list     = []
    end

    def create(attributes)
      ::Position.new(attributes).tap do |position|
        return unless position.valid?
        @list << position
        @listener.repository_create_success(position)
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
