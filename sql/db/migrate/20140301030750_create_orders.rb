class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :customer
      t.integer :price
      t.date :date

      t.timestamps
    end
  end
end
