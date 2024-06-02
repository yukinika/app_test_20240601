class SfExcelService
  def initialize(file:)
    @file = file
  end

  def read
    lines = read_excel
    return lines[0].strip if lines.size > 0
    nil
  end

  private

  def read_excel
    @file.read.force_encoding('UTF-8').lines
  end
end