class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.integer :user
      t.decimal :amount

      t.timestamps
    end
  end
end
