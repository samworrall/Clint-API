class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :location
      t.integer :price_range
      t.string :category

      t.timestamps
    end
  end
end
