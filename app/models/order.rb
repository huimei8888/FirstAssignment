# == Schema Information
#
# Table name: orders
#
#  id            :bigint(8)        not null, primary key
#  ordering_date :date
#  user_id       :bigint(8)
#  remark        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Order < ApplicationRecord
    validates :user, presence: true
    
    belongs_to :user 
    has_many :order_items
    has_many :menus, through: :order_items
    
    def total_amount
      total = 0.0
      order_items.each do |order_item|
        total += order_item.quantity * order_item.menu.price
      end
      total
    end
end

