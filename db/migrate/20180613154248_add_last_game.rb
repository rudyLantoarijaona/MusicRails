class AddLastGame < ActiveRecord::Migration[5.2]
  def change
    add_column :stats, :lastSong, :string
    add_column :stats, :lastAnswer, :string
    add_column :stats, :lastResponse, :string
    add_column :stats, :lastPoints, :string
  end
end
