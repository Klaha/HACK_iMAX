class CreateClientInfos < ActiveRecord::Migration
  def change
    create_table :client_infos do |t|
      t.references :show_transaction, index: true
      t.string :name
      t.integer :ci
      # t.timestamps
    end
  end
end
