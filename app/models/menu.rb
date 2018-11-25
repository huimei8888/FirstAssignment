# == Schema Information
#
# Table name: menus
#
#  id          :bigint(8)        not null, primary key
#  name        :string(255)      not null
#  price       :decimal(8, 2)
#  category_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Menu < ApplicationRecord
  belongs_to :category
  has_many :order_items
  
  
  has_one_attached :image
end
