module UseCase
  class GetToPositions
    def get(position)
      @listener.get_to_positions(position.to_positions)
    end

    def initialize(listener)
      @listener = listener
    end
  end
end
