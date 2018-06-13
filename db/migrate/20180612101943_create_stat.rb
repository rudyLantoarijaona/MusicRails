class CreateStat < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.integer :nbPartyPlay
      t.integer :nbPartyWin
      t.integer :scoreNow
      t.integer :scoreRecord
      t.integer :idUser
    end
  end
end
