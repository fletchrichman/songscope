class FixDumbDecimalInSong < ActiveRecord::Migration
  def change
  	change_column :songs, :rdio_id, :string
  end
end
