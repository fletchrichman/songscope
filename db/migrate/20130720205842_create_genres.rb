class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
    	t.string :name
    	t.integer :rating

      t.timestamps
    end
  end
end
