class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.date :release_date
      t.string :audience_rating
      t.string :image, default: "https://cgagrading.com/OnlineStore/images/products/GBOYCOL_large.jpg"

      t.timestamps
    end
  end
end
