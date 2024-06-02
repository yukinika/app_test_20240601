module FileReadable
  def initialize(file:)
    @file = file
  end

  def read
    read_file
  end

  private

  def read_file
    raise NotImplementedError, "You must implement the read_file method"
  end
end