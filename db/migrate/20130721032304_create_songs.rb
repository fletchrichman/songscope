class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
    	t.string :name
    	t.decimal :hotness
    	t.decimal :rdio_id
    	
      t.timestamps
    end
  end
end
