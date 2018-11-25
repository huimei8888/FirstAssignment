# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)      not null
#  email      :string(255)      not null
#  password   :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
    validates :password, presence: true, length: { minimum: 6 }
    validates :email, presence: true, uniqueness: true
    
    has_many :orders
end
