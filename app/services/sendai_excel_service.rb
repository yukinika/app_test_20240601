class SendaiExcelService
  def initialize(file:)
    @file = file
  end

  def read
    lines = @file.read.force_encoding('UTF-8').lines
    return lines[1].strip if lines.size > 1
    nil
  end
end