class CreateConfigs < ActiveRecord::Migration
  def change
    create_table :configs do |t|
      t.float :price_ticket_type_1

      t.timestamps
    end
  end
end
