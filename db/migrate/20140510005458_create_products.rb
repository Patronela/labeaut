class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :category
      t.string :name
      t.string :pic
      t.decimal :price

      t.timestamps
    end
  end
end
