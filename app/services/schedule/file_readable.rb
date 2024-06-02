module FileReadable
  def initialize(file:)
    raise ArgumentError, "file cannot be nil" if file.nil?
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