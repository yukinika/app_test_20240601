class FileUploadsController < ApplicationController
  def new
  end

  def create
    if params[:file].present?
      process_file_upload
    else
      handle_missing_file
    end

    render :new
  end

  private

  def process_file_upload
    service = ExcelServiceFactory.build(section: params[:section], file: params[:file])
    validator = AssiftValidator.new
    schedule = ScheduleService.new(excel_service: service, validator: validator)
    result = schedule.import
    handle_import_result(result)
  end

  def handle_missing_file
    @line = ["ファイルが選択されていません"]
  end

  def handle_import_result(result)
    if result[:is_success]
      handle_success(result)
    else
      handle_failure(result)
    end
  end

  def handle_success(result)
    # インポート成功時の処理を書く
    set_line_from_result(result)
  end

  def handle_failure(result)
    # インポート失敗時の処理を書く
    set_line_from_result(result)
  end

  def set_line_from_result(result)
    @line = result[:messages]
  end
end