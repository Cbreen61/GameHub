class CreatePlatforms < ActiveRecord::Migration[6.1]
  def change
    create_table :platforms do |t|
      t.string :name
      t.string :manufacturer
      t.string :image, default: "https://gametrog.com/wp-content/uploads/2019/01/Atari-2600-vader-front.jpg"
      t.integer :user_id

      t.timestamps
    end
  end
end
