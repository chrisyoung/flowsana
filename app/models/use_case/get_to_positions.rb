module UseCase
  class GetToPositions
    def initialize(listener)
      @listener = listener
    end

    #TODO This should be pulled from a repository
    def get(position)
      @listener.get_to_positions(position.to_positions)
    end
  end
end
