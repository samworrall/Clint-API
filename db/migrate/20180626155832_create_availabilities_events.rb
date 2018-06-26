class CreateAvailabilitiesEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities_events do |t|
      t.references :availability, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
