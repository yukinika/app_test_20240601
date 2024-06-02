class SendaiExcelService
  include FileReadable

  private

  def read_file
    lines = @file.read.force_encoding('UTF-8').lines
    return lines[1].strip if lines.size > 1
    nil
  end
end