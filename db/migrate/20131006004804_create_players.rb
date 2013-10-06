class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :active
      t.integer :player_number

      t.timestamps
    end
  end
end
