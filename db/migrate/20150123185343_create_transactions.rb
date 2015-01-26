class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :shows_id
      t.references :user, index: true
      t.references :show, index: true
      t.datetime :datetime_transaction

      t.timestamps
    end
  end
end
