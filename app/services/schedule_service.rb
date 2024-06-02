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
      insert_schedules(line)
    end
    
    generate_messages(line, result)
  end

  def fetch_schedules
    # DBからデータを取得する処理
  end

  def delete_schedules
    # DBからデータを削除する処理
  end

  private

  def insert_schedules(schedules)
    # DBにデータを保存する処理
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
