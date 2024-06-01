class ScheduleService
  def initialize(excel_service: nil, section: nil, year: nil, month: nil)
    @excel_service = excel_service
    @section = section
    @year = year
    @month = month
  end

  def import
    # ファイル読み込み
    line = @excel_service.read

    # バリデーション
    result = AssiftValidator.contains_pikachu?(text: line)

    if result
      # バリデーションに成功したらDBにデータを保存する処理
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
