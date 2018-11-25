# == Schema Information
#
# Table name: admins
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  email      :string(255)
#  password   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Admin < ApplicationRecord
    validates :password, presence: true, length: { minimum: 6 }
    validates :email, presence: true, uniqueness: true
end
