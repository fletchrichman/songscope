class AddHotnessAndGenresToRegion < ActiveRecord::Migration
  def change
  	add_column :regions, :hotness, :decimal
  	add_column :regions, :genres, :string
  end
end
