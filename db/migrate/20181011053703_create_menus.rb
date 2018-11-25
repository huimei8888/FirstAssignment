class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.decimal :price, precision: 8, scale: 2
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
