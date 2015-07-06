module Repository
  class TransitionMemory
    attr_accessor :list
    def initialize
      @list     = []
    end

    def create(attributes)
      ::Transition.new(attributes).tap do |transition|
        return unless transition.valid?
        @list << transition
      end
    end

    def first
      @list.first
    end

    def count
      @list.count
    end
  end
end
