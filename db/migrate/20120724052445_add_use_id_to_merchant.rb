class AddUseIdToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :user_id, :integer
  end
end
