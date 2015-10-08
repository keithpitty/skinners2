class RemovePlayerNumber < ActiveRecord::Migration
  def change
    remove_column :players, :player_number
  end
end
