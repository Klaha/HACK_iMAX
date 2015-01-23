class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :sinopsis
      t.time :duration
      t.string :image

      t.timestamps
    end
  end
end
