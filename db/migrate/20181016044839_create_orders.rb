class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :ordering_date
      t.references :user, foreign_key: true
      t.string :remark

      t.timestamps
    end
  end
end
