class AddSecondPosterUrlToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :second_poster_url, :string
  end
end
