class User < ActiveRecord::Base
  has_many :phone_number
end
