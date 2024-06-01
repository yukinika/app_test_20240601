class ApplicationController < ActionController::Base
  before_action :set_remote_ip
  before_action :set_employee_id

  private

  def set_remote_ip
    CurrentService.remote_ip = request.remote_ip
  end

  def set_employee_id
    # ここで社員番号をセットする処理を書く
    CurrentService.employee_id = "だみー"
  end
end
