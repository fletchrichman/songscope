class ChangeArtistHotnessToDecimal < ActiveRecord::Migration
  def change
  	change_column :artists, :hotness, :decimal
  end
end
