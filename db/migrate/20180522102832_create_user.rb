class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.string :password
      t.integer :bestScore
      t.integer :lastScore

    end
  end
end
