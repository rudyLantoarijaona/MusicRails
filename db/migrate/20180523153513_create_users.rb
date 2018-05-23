class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.mail :artist
      t.string :password
      t.integer :bestScore
      t.integer :lastScore

      t.timestamps
    end
  end
end
