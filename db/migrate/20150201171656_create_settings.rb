class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.float :price_ticket_type_1

      t.timestamps
    end
  end
end
