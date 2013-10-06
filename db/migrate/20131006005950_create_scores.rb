class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :player, index: true
      t.references :round, index: true
      t.references :player_round, index: true
      t.references :hole, index: true
      t.integer :points

      t.timestamps
    end
  end
end
