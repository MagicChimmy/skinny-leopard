class AddDetailsToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_column :instruments, :category, :string
    add_column :instruments, :description, :text
  end
end
