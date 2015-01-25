class CreateTablesForTransactionsEmployee < ActiveRecord::Migration
  def change
    create_table :show_transactions do |t|
      t.references :user, index: true
      t.references :show, index: true
      t.datetime :datetime_transaction
      #t.timestamps
    end

    create_table :tickets do |t|
      t.references :show_transaction, index: true
      t.string :type_ticket
      t.float :price
      #t.timestamps
    end

    create_table :seats do |t|
      t.integer :row
      t.integer :col
      t.timestamp
    end

    create_table :seat_shows do |t|
      t.references :show, index: true
      t.references :seat , index: true
      t.references :ticket, index: true
      t.string :status
    end
  end
end
