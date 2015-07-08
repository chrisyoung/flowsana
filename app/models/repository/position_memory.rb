module Repository
  class PositionMemory
    attr_accessor :listener

    def initialize(listener=nil)
      @listener = listener
    end

    def list
      @list ||= []
    end

    def get
      @listener.repository_get_success(list) if @listener
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
