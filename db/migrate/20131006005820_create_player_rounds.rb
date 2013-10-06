class CreatePlayerRounds < ActiveRecord::Migration
  def change
    create_table :player_rounds do |t|
      t.references :player, index: true
      t.references :round, index: true
      t.boolean :no_three_pointers

      t.timestamps
    end
  end
end
