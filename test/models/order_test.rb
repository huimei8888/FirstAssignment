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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
