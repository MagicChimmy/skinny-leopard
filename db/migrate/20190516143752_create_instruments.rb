class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :name
      t.integer :price
      t.string :photo
      t.string :location
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
