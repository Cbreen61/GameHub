class CreateOwnedGames < ActiveRecord::Migration[6.1]
  def change
    create_table :owned_games do |t|
      t.integer :platform_id
      t.integer :game_id

      t.timestamps
    end
  end
end
