class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.float :discount
      t.datetime :expired_at
    end
  end
end
