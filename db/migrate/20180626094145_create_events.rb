class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :date

      t.timestamps
    end
  end
end
