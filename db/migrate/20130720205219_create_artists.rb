class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
    	t.string :name
    	t.integer :hotness
    	t.string :song_url 

      t.timestamps
    end
  end
end
