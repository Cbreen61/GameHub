class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.date :release_date
      t.string :description, :limit => 100
      t.string :image

      t.timestamps
    end
  end
end
