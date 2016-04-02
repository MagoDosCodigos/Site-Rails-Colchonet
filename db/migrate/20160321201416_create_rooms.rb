class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :location
      t.text :description
      t.string :pricing

      t.timestamps null: false
    end
  end
end
