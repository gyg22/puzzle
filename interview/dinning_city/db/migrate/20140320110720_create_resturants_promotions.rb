class CreateResturantsPromotions < ActiveRecord::Migration
  def change
    create_table :resturants_promotions, id: false do |t|
      t.references :resturant, index: true
      t.references :promotion, index: true
    end
  end
end
