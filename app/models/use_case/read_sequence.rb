module UseCase
  class ReadSequence
    attr_accessor :repository

    def initialize(listener, repository=nil)
      @listener   = listener
      @repository = (repository || Repository::Memory::Sequence).new(self)
    end

    def read(id)
      @repository.read(id)
    end

    def sequence_repository_read_success(sequence)
      @listener.read_sequence_success(sequence)
    end

    def sequence_repository_read_failure
      @listener.read_sequence_failure
    end
  end
end
