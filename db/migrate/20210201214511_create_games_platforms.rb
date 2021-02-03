class CreateGamesPlatforms < ActiveRecord::Migration[6.1]
  def change
    create_table :games_platforms do |t|
      t.integer :platform_id
      t.integer :game_id

      t.timestamps
    end
  end
end
