class ScheduleService
  def initialize(excel_service: nil, validator:nil, section: nil, year: nil, month: nil)
    @excel_service = excel_service
    @validator = validator
    @section = section
    @year = year
    @month = month
  end

  def import
    # ファイル読み込み
    line = @excel_service.read

    # バリデーション
    result = @validator.contains_pikachu?(text: line)

    if result
      # バリデーションに成功したらDBにデータを保存
      insert_schedules_to_db(line)
    end
    
    generate_messages(line, result)
  end

  def get_schedules
    fetch_schedules_from_db
  end

  def delete_schedules
    delete_schedules_from_db
  end

  private

  def insert_schedules_to_db(schedules)
    # DBにデータを保存する処理
  end

  def fetch_schedules_from_db
    # DBからデータを取得する処理
  end

  def delete_schedules_from_db
    # DBからデータを取得する処理
  end

  def generate_messages(line, result)
    messages = []

    # ためしにここでIPアドレスを取得してみる
    messages.push("接続元IPアドレス：#{CurrentService.remote_ip}")
    messages.push("取得した文字列：#{line}")

    if result
      messages.push("「ピカチュウ」が含まれています。")
      {
        is_success: true,
        messages: messages
      }
    else
      messages.push("「ピカチュウ」が含まれていません。")
      {
        is_success: false,
        messages: messages
      }
    end
  end
end
