class SfExcelService
  def initialize(file:)
    @file = file
  end

  def read
    lines = @file.read.force_encoding('UTF-8').lines
    return lines[0].strip if lines.size > 0
    nil
  end
end