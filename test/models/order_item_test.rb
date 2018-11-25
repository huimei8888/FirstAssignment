# == Schema Information
#
# Table name: order_items
#
#  id         :bigint(8)        not null, primary key
#  order_id   :bigint(8)
#  menu_id    :bigint(8)
#  quantity   :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
