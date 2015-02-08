class AddMovieField < ActiveRecord::Migration
  def change
    change_table :movies do |t|
      t.string :img_carrousel
      # t.remove :description, :name
      # t.string :part_number
      # t.index :part_number
      # t.rename :upccode, :upc_code
    end
    change_column :movies, :sinopsis, :text
  end
end
