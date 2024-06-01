class ExcelServiceFactory
  def self.build(section:, file:)
    case section
      when 'SF'
        SfExcelService.new(file: file)
      when '仙台'
        SendaiExcelService.new(file: file)
      else
        raise "Unknown section: #{section}"
    end
  end
end
