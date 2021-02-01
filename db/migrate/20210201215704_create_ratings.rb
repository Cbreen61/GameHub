class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.string :comment
      t.string :stars, :limit => 5
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end
end
