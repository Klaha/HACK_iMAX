class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :ci
      t.string :email
      t.string :password
      t.string :role

      t.timestamps
    end
  end
end
