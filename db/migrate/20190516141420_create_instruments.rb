class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :name
      t.integer :price
      t.string :photo
      t.string :location

      t.timestamps
    end
  end
end


      # t.references :booking, foreign_key: true
