module Repository
  class PositionMemory
    def list
      @list ||= []
    end

    def get
      list
    end

    def clear
      @list = []
    end

    def create(attributes)
      ::Position.new(attributes).tap do |position|
        return unless position.valid?
        list << position
      end
    end

    def count
      list.count
    end

    def first
      list.first
    end
  end
end
