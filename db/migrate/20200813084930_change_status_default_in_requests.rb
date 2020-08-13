class ChangeStatusDefaultInRequests < ActiveRecord::Migration[6.0]
  def change
    change_column_default :requests, :status, "pending"
  end
end
