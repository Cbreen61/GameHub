class CreatePlatforms < ActiveRecord::Migration[6.1]
  def change
    create_table :platforms do |t|
      t.string :name
      t.string :manufacturer
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
