class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :birthday
      t.timestamps
    end
  end
end
