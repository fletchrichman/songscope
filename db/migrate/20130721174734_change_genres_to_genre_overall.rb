class ChangeGenresToGenreOverall < ActiveRecord::Migration
  def change
  	remove_column :regions, :genres
  	add_column :regions, :genre_overall, :string
  end
end
